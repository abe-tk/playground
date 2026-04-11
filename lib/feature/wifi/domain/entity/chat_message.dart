import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';

/// チャットメッセージ
@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String text,
    required bool isMe,
    required DateTime timestamp,
  }) = _ChatMessage;
}
