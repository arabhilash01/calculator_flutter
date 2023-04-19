import 'package:calculator/internal/colors.dart';
import 'package:calculator/presentation/widgets/calculator-screen.dart';
import 'package:calculator/presentation/widgets/keypad.dart';
import 'package:flutter/material.dart';

class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: BackgoundColors.mainBackground,
        width: double.infinity,
        child: Column(
          children: const [Expanded(flex: 4, child: CalculatorScreen()), Expanded(flex: 7, child: Keypad())],
        ),
      )),
    );
  }
}
