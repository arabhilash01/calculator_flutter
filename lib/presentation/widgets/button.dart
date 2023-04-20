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
    bool _isSpecial = ['c', '<-', '%', '+/-'].contains(name);
    bool _isEqual = name == '=';
    return GestureDetector(
      onTap: () {
        if (_isOperator) {
          _calculate(ref, name);
          ref
              .read(historyValueProvider.notifier)
              .update((state) => state + ref.read(operatorValueProvider) + ref.read(valueProvider));

          ref.read(valueProvider.notifier).state = '';
          ref.read(operatorValueProvider.notifier).update((state) => name);
        }
        if (_isSpecial) {
          if (name == 'c') {
            ref.read(valueProvider.notifier).update((state) => '');
            ref.read(historyValueProvider.notifier).update((state) => '');
            ref.read(operatorValueProvider.notifier).update((state) => '');
            ref.read(intermediateValueProvider.notifier).reset();
          }
        }
        if (_isEqual) {
          //  _calculate(ref, name);
          ref.read(valueProvider.notifier).update((state) => ref.watch(intermediateValueProvider).toString());
        }
        if (!_isSpecial && !_isOperator && !_isEqual) ref.read(valueProvider.notifier).update((state) => state + name);
      },
      child: Container(
        decoration: BoxDecoration(
          color: _getColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow:const [
             BoxShadow(
              color: Colors.white,
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
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
  notifier.operator(operator, int.parse(value));
}
