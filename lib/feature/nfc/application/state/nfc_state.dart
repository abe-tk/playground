import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:playground/feature/nfc/domain/entity/nfc_record.dart';
import 'package:playground/feature/nfc/domain/repository/nfc_repository.dart';
import 'package:playground/feature/nfc/infra/repository/nfc_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nfc_state.freezed.dart';
part 'nfc_state.g.dart';

@freezed
abstract class NfcState with _$NfcState {
  const factory NfcState({
    @Default(NfcAvailability.unsupported) NfcAvailability availability,
    @Default(false) bool isReading,
    @Default(false) bool isWriting,
    @Default([]) List<NfcRecord> readRecords,
    String? writeResult,
    String? error,
  }) = _NfcState;
}

@riverpod
class NfcNotifier extends _$NfcNotifier {
  @override
  NfcState build() {
    ref.watch(nfcRepositoryProvider);
    return const NfcState();
  }

  /// NFC 利用可否をチェックする（画面表示時に呼ぶ）
  Future<void> checkAvailability() async {
    final repository = ref.read(nfcRepositoryProvider);
    try {
      final availability = await repository.checkAvailability();
      state = state.copyWith(availability: availability, error: null);
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> readTag() async {
    if (state.isReading || state.isWriting) return;
    final repository = ref.read(nfcRepositoryProvider);
    state = state.copyWith(
      isReading: true,
      error: null,
      readRecords: [],
      writeResult: null,
    );
    try {
      final records = await repository.read();
      state = state.copyWith(readRecords: records, isReading: false);
    } on Exception catch (e) {
      state = state.copyWith(isReading: false, error: e.toString());
    }
  }

  Future<void> writeText(String text) async {
    if (text.isEmpty) return;
    await _runWrite(() => ref.read(nfcRepositoryProvider).writeText(text));
  }

  Future<void> writeUri(Uri uri) async {
    await _runWrite(() => ref.read(nfcRepositoryProvider).writeUri(uri));
  }

  Future<void> _runWrite(Future<void> Function() action) async {
    if (state.isReading || state.isWriting) return;
    state = state.copyWith(
      isWriting: true,
      error: null,
      writeResult: null,
    );
    try {
      await action();
      state = state.copyWith(isWriting: false, writeResult: '書き込み成功');
    } on Exception catch (e) {
      state = state.copyWith(isWriting: false, error: e.toString());
    }
  }

  /// 実行中のセッションを停止する（UI の「キャンセル」用）
  Future<void> stopSession() async {
    await ref.read(nfcRepositoryProvider).stopSession();
    state = state.copyWith(isReading: false, isWriting: false);
  }
}
