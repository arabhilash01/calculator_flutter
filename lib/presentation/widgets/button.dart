import 'package:calculator/internal/providers/value.dart';
import 'package:flutter/material.dart';

import 'package:calculator/internal/colors.dart';
import 'package:calculator/internal/models/button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyButton extends ConsumerWidget {
  final String name;
  final ButtonType type;
  const KeyButton({
    Key? key,
    required this.name,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _isOperator = ['+', '-', '/', 'X'].contains(name);
    bool _isSpecial = ['c', '<-', '%'].contains(name);
    bool _isEqual = name == '=';
    return GestureDetector(
      onTap: () {
        if (_isOperator) {
          ref
              .read(historyValueProvider.notifier)
              .update((state) => state + ref.read(operatorValueProvider) + ref.read(valueProvider));
          _calculate(ref, name);
          // ref.read(intermediateValueProvider.notifier).update((state) => int.parse(ref.read(valueProvider)));
          ref.read(valueProvider.notifier).state = '';
          ref.read(operatorValueProvider.notifier).update((state) => name);
        }
        if (_isSpecial) {
          if(name=='c'){
          ref.read(valueProvider.notifier).update((state) => '');
          ref.read(historyValueProvider.notifier).update((state) => '');
          ref.read(operatorValueProvider.notifier).update((state) => '');
          ref.read(intermediateValueProvider.notifier).update((state) => 0);
          }
          
        }
        if (_isEqual) {
          
          ref.read(valueProvider.notifier).update((state) => ref.watch(intermediateValueProvider).toString());
        }
        if (!_isSpecial && !_isOperator && !_isEqual) ref.read(valueProvider.notifier).update((state) => state + name);
      },
      child: Container(
        decoration: BoxDecoration(color: _getColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Color get _getColor {
    switch (type) {
      case ButtonType.normal:
        return BackgoundColors.button;

      case ButtonType.operators:
        return BackgoundColors.sideButton;

      case ButtonType.special:
        return BackgoundColors.special;
    }
  }
}

_calculate(WidgetRef ref, String operator) {
  final notifier = ref.read(intermediateValueProvider.notifier);
  final value = ref.watch(valueProvider);

  switch (operator) {
    case '+':
      notifier.update((state) => state + int.parse(value));
      print(int.parse(value));
      print('intermediate value');
      print(ref.read(intermediateValueProvider));
      break;
    case '-':
      notifier.update((state) => state - int.parse(value));
      break;
    case 'X':
      notifier.update((state) => state * int.parse(value));
      break;
    case '/':
      notifier.update((state) => state ~/ int.parse(value));
      break;
  }
}
