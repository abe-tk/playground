import 'dart:convert';

/// カウンター操作コマンド
enum CounterCommand {
  increment,
  decrement,
  reset
  ;

  List<int> encode() => utf8.encode(name);

  static CounterCommand? decode(List<int> bytes) {
    final value = utf8.decode(bytes);
    return CounterCommand.values.cast<CounterCommand?>().firstWhere(
      (c) => c?.name == value,
      orElse: () => null,
    );
  }
}
