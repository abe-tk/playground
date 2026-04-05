import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:playground/feature/ble/domain/entity/counter_command.dart';

void main() {
  group('CounterCommand', () {
    group('encode', () {
      test('encodes increment as UTF-8 bytes', () {
        final bytes = CounterCommand.increment.encode();

        expect(bytes, utf8.encode('increment'));
      });

      test('encodes decrement as UTF-8 bytes', () {
        final bytes = CounterCommand.decrement.encode();

        expect(bytes, utf8.encode('decrement'));
      });

      test('encodes reset as UTF-8 bytes', () {
        final bytes = CounterCommand.reset.encode();

        expect(bytes, utf8.encode('reset'));
      });
    });

    group('decode', () {
      test('decodes increment from UTF-8 bytes', () {
        final command = CounterCommand.decode(utf8.encode('increment'));

        expect(command, CounterCommand.increment);
      });

      test('decodes decrement from UTF-8 bytes', () {
        final command = CounterCommand.decode(utf8.encode('decrement'));

        expect(command, CounterCommand.decrement);
      });

      test('decodes reset from UTF-8 bytes', () {
        final command = CounterCommand.decode(utf8.encode('reset'));

        expect(command, CounterCommand.reset);
      });

      test('returns null for unknown command', () {
        final command = CounterCommand.decode(utf8.encode('unknown'));

        expect(command, isNull);
      });

      test('returns null for empty bytes', () {
        final command = CounterCommand.decode([]);

        expect(command, isNull);
      });
    });

    group('encode/decode roundtrip', () {
      for (final command in CounterCommand.values) {
        test('roundtrips ${command.name}', () {
          final decoded = CounterCommand.decode(command.encode());

          expect(decoded, command);
        });
      }
    });
  });
}
