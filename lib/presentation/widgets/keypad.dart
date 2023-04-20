import 'package:calculator/internal/models/button.dart';
import 'package:calculator/presentation/widgets/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  const Keypad({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
        children: [
          for (Buttons i in buttons)
            KeyButton(
              name: i.name,
              type: i.type,
            )
        ],
      ),
    );
  }
}

List<Buttons> buttons = [
  Buttons(name: 'c', type: ButtonType.special),
  Buttons(name: '+/-', type: ButtonType.special),
  Buttons(name: '%', type: ButtonType.special),
  Buttons(name: '/', type: ButtonType.operators),
  Buttons(name: '7'),
  Buttons(name: '8'),
  Buttons(name: '9'),
  Buttons(name: 'X', type: ButtonType.operators),
  Buttons(name: '4'),
  Buttons(name: '5'),
  Buttons(name: '6'),
  Buttons(name: '-', type: ButtonType.operators),
  Buttons(name: '1'),
  Buttons(name: '2'),
  Buttons(name: '3'),
  Buttons(name: '+', type: ButtonType.operators),
  Buttons(name: '<-', type: ButtonType.special),
  Buttons(name: '0'),
  Buttons(name: '.'),
  Buttons(name: '=', type: ButtonType.operators),
];
