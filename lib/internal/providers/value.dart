import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'value.g.dart';

final valueProvider = StateProvider((ref) => '');
final historyValueProvider = StateProvider((ref) => '');
final operatorValueProvider = StateProvider((ref) => '');
// final intermediateValueProvider = StateProvider((ref) => 0);

@Riverpod(keepAlive: true)
class IntermediateValue extends _$IntermediateValue {
  @override
  int build() {
    return 0;
  }

  void operator(String op, int newValue) {
    if (state == 0) {
      state = newValue;
    } else {
      switch (op) {
        case '+':
          state += newValue;
          break;
        case '-':
          state = state - newValue;
          break;
        case 'X':
          state *= newValue;
          break;
        case '/':
          try {
            state ~/= newValue;
          } catch (e) {
            state = 0;
          }
          break;
      }
    }
  }

  void setValue(int val) {
    state = val;
  }

  void reset() {
    state = 0;
  }
}
