import 'package:freezed_annotation/freezed_annotation.dart';

part 'nfc_record.freezed.dart';

/// NDEF レコードのドメイン表現
///
/// nfc_manager の NdefRecord をそのまま持たず、
/// UI が必要とする形に infra 層でデコードした結果を保持する。
@freezed
abstract class NfcRecord with _$NfcRecord {
  const factory NfcRecord({
    required NfcRecordKind kind,
    required String payload,
  }) = _NfcRecord;
}

/// レコード種別（UI 表示の分岐に使う）
enum NfcRecordKind {
  /// NDEF テキストレコード（TNF=wellKnown, type="T"）
  text,

  /// NDEF URI レコード（TNF=wellKnown, type="U"）
  uri,

  /// その他（TNF や type が上記以外）
  other,
}
