import 'package:playground/feature/nfc/domain/entity/nfc_record.dart';

/// NFC タグの読み書きを行う Repository
abstract class NfcRepository {
  /// 端末の NFC 利用可否を返す
  Future<NfcAvailability> checkAvailability();

  /// NFC セッションを開始してタグを読み取る
  ///
  /// タグが検出されると NDEF レコードをデコードして返し、セッションは自動終了する。
  Future<List<NfcRecord>> read();

  /// テキストを NDEF テキストレコードとして書き込む
  Future<void> writeText(String text);

  /// URI を NDEF URI レコードとして書き込む
  Future<void> writeUri(Uri uri);

  /// 実行中のセッションを停止する（UI からのキャンセル用）
  Future<void> stopSession();
}

/// NFC の利用可否
enum NfcAvailability {
  /// 利用可能
  enabled,

  /// ハードウェアはあるが OFF
  disabled,

  /// ハードウェア非対応
  unsupported,
}
