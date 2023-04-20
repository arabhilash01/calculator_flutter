import 'package:calculator/internal/colors.dart';
import 'package:calculator/internal/providers/value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider);
    final historyValue = ref.watch(historyValueProvider);
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: BackgoundColors.primary),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(historyValue, style: TextStyle(fontSize: 30)),
            Text(ref.watch(operatorValueProvider)),
            Text(
              value,
              style: TextStyle(fontSize: 50),
            ),
            Text(
              ref.read(intermediateValueProvider).toString(),
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
