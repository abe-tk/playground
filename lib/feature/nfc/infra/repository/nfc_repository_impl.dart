import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:nfc_manager/ndef_record.dart' as nfc;
import 'package:nfc_manager/nfc_manager.dart' as nfc;
import 'package:nfc_manager/nfc_manager_android.dart' as android;
import 'package:nfc_manager/nfc_manager_ios.dart' as ios;
import 'package:playground/feature/nfc/domain/entity/nfc_record.dart';
import 'package:playground/feature/nfc/domain/repository/nfc_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nfc_repository_impl.g.dart';

@riverpod
NfcRepository nfcRepository(Ref ref) => NfcRepositoryImpl();

class NfcRepositoryImpl implements NfcRepository {
  /// セッション中のみ有効な Completer。startSession の onDiscovered と
  /// onSessionErrorIos から共通に参照するため保持する。
  Completer<dynamic>? _completer;

  @override
  Future<NfcAvailability> checkAvailability() async {
    final result = await nfc.NfcManager.instance.checkAvailability();
    return switch (result) {
      nfc.NfcAvailability.enabled => NfcAvailability.enabled,
      nfc.NfcAvailability.disabled => NfcAvailability.disabled,
      nfc.NfcAvailability.unsupported => NfcAvailability.unsupported,
    };
  }

  @override
  Future<List<NfcRecord>> read() async {
    return _runSession<List<NfcRecord>>(
      alertMessage: 'NFC タグをかざしてください',
      onTag: (tag) async {
        final message = await _readNdefMessage(tag);
        return (message?.records ?? const <nfc.NdefRecord>[])
            .map(_decodeRecord)
            .toList();
      },
    );
  }

  @override
  Future<void> writeText(String text) async {
    final record = _buildTextRecord(text);
    await _writeMessage(nfc.NdefMessage(records: [record]));
  }

  @override
  Future<void> writeUri(Uri uri) async {
    final record = _buildUriRecord(uri);
    await _writeMessage(nfc.NdefMessage(records: [record]));
  }

  @override
  Future<void> stopSession() async {
    try {
      await nfc.NfcManager.instance.stopSession();
    } on Exception catch (e) {
      log('NFC stopSession エラー: $e');
    }
    final completer = _completer;
    if (completer != null && !completer.isCompleted) {
      completer.completeError(const NfcSessionCanceled());
    }
    _completer = null;
  }

  Future<void> _writeMessage(nfc.NdefMessage message) async {
    await _runSession<void>(
      alertMessage: 'NFC タグをかざして書き込みます',
      successMessage: '書き込み完了',
      onTag: (tag) async {
        await _writeNdefMessage(tag, message);
      },
    );
  }

  /// startSession → onDiscovered → stopSession の共通フロー。
  ///
  /// [onTag] の結果で Completer を complete し、例外は completeError で返す。
  Future<T> _runSession<T>({
    required String alertMessage,
    required Future<T> Function(nfc.NfcTag tag) onTag,
    String? successMessage,
  }) async {
    final completer = Completer<T>();
    _completer = completer;

    try {
      await nfc.NfcManager.instance.startSession(
        pollingOptions: const {
          nfc.NfcPollingOption.iso14443,
          nfc.NfcPollingOption.iso15693,
          nfc.NfcPollingOption.iso18092,
        },
        alertMessageIos: alertMessage,
        onSessionErrorIos: (error) {
          if (!completer.isCompleted) {
            completer.completeError(NfcSessionError(error.toString()));
          }
        },
        onDiscovered: (tag) async {
          try {
            final result = await onTag(tag);
            await nfc.NfcManager.instance.stopSession(
              alertMessageIos: successMessage,
            );
            if (!completer.isCompleted) {
              completer.complete(result);
            }
          } on Exception catch (e) {
            await nfc.NfcManager.instance.stopSession(
              errorMessageIos: e.toString(),
            );
            if (!completer.isCompleted) {
              completer.completeError(e);
            }
          }
        },
      );
      return await completer.future;
    } finally {
      _completer = null;
    }
  }

  Future<nfc.NdefMessage?> _readNdefMessage(nfc.NfcTag tag) async {
    if (Platform.isAndroid) {
      final ndef = android.NdefAndroid.from(tag);
      if (ndef == null) throw const NfcTagNotNdef();
      return ndef.cachedNdefMessage ?? await ndef.getNdefMessage();
    }
    if (Platform.isIOS) {
      final ndef = ios.NdefIos.from(tag);
      if (ndef == null) throw const NfcTagNotNdef();
      return ndef.cachedNdefMessage ?? await ndef.readNdef();
    }
    throw UnsupportedError('NFC は未対応のプラットフォームです');
  }

  Future<void> _writeNdefMessage(
    nfc.NfcTag tag,
    nfc.NdefMessage message,
  ) async {
    if (Platform.isAndroid) {
      final ndef = android.NdefAndroid.from(tag);
      if (ndef == null) throw const NfcTagNotNdef();
      if (!ndef.isWritable) throw const NfcTagReadOnly();
      await ndef.writeNdefMessage(message);
      return;
    }
    if (Platform.isIOS) {
      final ndef = ios.NdefIos.from(tag);
      if (ndef == null) throw const NfcTagNotNdef();
      if (ndef.status != ios.NdefStatusIos.readWrite) {
        throw const NfcTagReadOnly();
      }
      await ndef.writeNdef(message);
      return;
    }
    throw UnsupportedError('NFC は未対応のプラットフォームです');
  }

  // ---- NDEF エンコード / デコード ----

  /// NDEF テキストレコードを組み立てる（UTF-8 固定、言語コード "en"）。
  nfc.NdefRecord _buildTextRecord(String text) {
    const lang = 'en';
    final langBytes = ascii.encode(lang);
    final textBytes = utf8.encode(text);
    final payload = Uint8List(1 + langBytes.length + textBytes.length)
      ..[0] =
          langBytes.length &
          0x3F // UTF-8、言語コード長
      ..setRange(1, 1 + langBytes.length, langBytes)
      ..setRange(
        1 + langBytes.length,
        1 + langBytes.length + textBytes.length,
        textBytes,
      );
    return nfc.NdefRecord(
      typeNameFormat: nfc.TypeNameFormat.wellKnown,
      type: Uint8List.fromList(ascii.encode('T')),
      identifier: Uint8List(0),
      payload: payload,
    );
  }

  /// NDEF URI レコードを組み立てる。既知プレフィックスに一致するものは
  /// プレフィックスバイトに圧縮する。
  nfc.NdefRecord _buildUriRecord(Uri uri) {
    final uriString = uri.toString();
    var prefixIndex = 0;
    var remainder = uriString;
    for (var i = 1; i < _uriPrefixes.length; i++) {
      final prefix = _uriPrefixes[i];
      if (prefix.isNotEmpty && uriString.startsWith(prefix)) {
        prefixIndex = i;
        remainder = uriString.substring(prefix.length);
        break;
      }
    }
    final remainderBytes = utf8.encode(remainder);
    final payload = Uint8List(1 + remainderBytes.length)
      ..[0] = prefixIndex
      ..setRange(1, 1 + remainderBytes.length, remainderBytes);
    return nfc.NdefRecord(
      typeNameFormat: nfc.TypeNameFormat.wellKnown,
      type: Uint8List.fromList(ascii.encode('U')),
      identifier: Uint8List(0),
      payload: payload,
    );
  }

  NfcRecord _decodeRecord(nfc.NdefRecord record) {
    if (record.typeNameFormat == nfc.TypeNameFormat.wellKnown) {
      final typeString = ascii.decode(record.type, allowInvalid: true);
      if (typeString == 'T') {
        return NfcRecord(
          kind: NfcRecordKind.text,
          payload: _decodeText(record.payload),
        );
      }
      if (typeString == 'U') {
        return NfcRecord(
          kind: NfcRecordKind.uri,
          payload: _decodeUri(record.payload),
        );
      }
    }
    if (record.typeNameFormat == nfc.TypeNameFormat.absoluteUri) {
      return NfcRecord(
        kind: NfcRecordKind.uri,
        payload: utf8.decode(record.type, allowMalformed: true),
      );
    }
    return NfcRecord(
      kind: NfcRecordKind.other,
      payload: _hex(record.payload),
    );
  }

  String _decodeText(Uint8List payload) {
    if (payload.isEmpty) return '';
    final status = payload[0];
    final isUtf16 = (status & 0x80) != 0;
    final langLen = status & 0x3F;
    if (payload.length < 1 + langLen) return '';
    final textBytes = payload.sublist(1 + langLen);
    if (isUtf16) {
      // BOM があれば判別、無ければ big-endian 想定（NDEF 仕様のデフォルト）
      return _decodeUtf16(textBytes);
    }
    return utf8.decode(textBytes, allowMalformed: true);
  }

  String _decodeUri(Uint8List payload) {
    if (payload.isEmpty) return '';
    final prefixIndex = payload[0];
    final prefix = prefixIndex < _uriPrefixes.length
        ? _uriPrefixes[prefixIndex]
        : '';
    final rest = utf8.decode(payload.sublist(1), allowMalformed: true);
    return '$prefix$rest';
  }

  String _decodeUtf16(Uint8List bytes) {
    if (bytes.length < 2) return '';
    var offset = 0;
    var littleEndian = false;
    if (bytes[0] == 0xFF && bytes[1] == 0xFE) {
      littleEndian = true;
      offset = 2;
    } else if (bytes[0] == 0xFE && bytes[1] == 0xFF) {
      offset = 2;
    }
    final codeUnits = <int>[];
    for (var i = offset; i + 1 < bytes.length; i += 2) {
      final hi = bytes[i];
      final lo = bytes[i + 1];
      codeUnits.add(littleEndian ? (lo << 8) | hi : (hi << 8) | lo);
    }
    return String.fromCharCodes(codeUnits);
  }

  String _hex(Uint8List bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ');
}

/// NDEF URI レコードのプレフィックステーブル（NFC Forum URI RTD）
const List<String> _uriPrefixes = [
  '', // 0x00: プレフィックスなし
  'http://www.',
  'https://www.',
  'http://',
  'https://',
  'tel:',
  'mailto:',
  'ftp://anonymous:anonymous@',
  'ftp://ftp.',
  'ftps://',
  'sftp://',
  'smb://',
  'nfs://',
  'ftp://',
  'dav://',
  'news:',
  'telnet://',
  'imap:',
  'rtsp://',
  'urn:',
  'pop:',
  'sip:',
  'sips:',
  'tftp:',
  'btspp://',
  'btl2cap://',
  'btgoep://',
  'tcpobex://',
  'irdaobex://',
  'file://',
  'urn:epc:id:',
  'urn:epc:tag:',
  'urn:epc:pat:',
  'urn:epc:raw:',
  'urn:epc:',
  'urn:nfc:',
];

/// NFC 関連の例外
class NfcSessionCanceled implements Exception {
  const NfcSessionCanceled();
  @override
  String toString() => 'NFC セッションがキャンセルされました';
}

class NfcSessionError implements Exception {
  const NfcSessionError(this.message);
  final String message;
  @override
  String toString() => 'NFC セッションエラー: $message';
}

class NfcTagNotNdef implements Exception {
  const NfcTagNotNdef();
  @override
  String toString() => 'NDEF 非対応のタグです';
}

class NfcTagReadOnly implements Exception {
  const NfcTagReadOnly();
  @override
  String toString() => '書き込み不可（読み取り専用）のタグです';
}
