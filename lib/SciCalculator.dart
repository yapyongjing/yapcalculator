import 'package:flutter/material.dart';
import 'result_display.dart';
import 'SciCalculator_button.dart';
import 'dart:math';

class SciCalculator extends StatefulWidget {
  const SciCalculator({super.key});

  @override
  State<SciCalculator> createState() => _SciCalculatorState();
}

class _SciCalculatorState extends State<SciCalculator> {
  double width = 0;
  double? firstOperand;
  String? operator;
  double? secondOperand;
  double? result;
  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Column(children: [
      ResultDisplay(text: _getDisplayText()),
      Row(
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Scientific'),
          ),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.sync),
          ),
          const Spacer(flex: 1),
          _getButton(
              text: 'sin',
              onTap: () => operatorPressed('sin'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
        ],
      ),
      Row(
        children: [
          _getButton(text: '7', onTap: () => numberPressed(7)),
          _getButton(text: '8', onTap: () => numberPressed(8)),
          _getButton(text: '9', onTap: () => numberPressed(9)),
          _getButton(
              text: 'cos',
              onTap: () => operatorPressed('cos'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
        ],
      ),
      Row(
        children: [
          _getButton(text: '4', onTap: () => numberPressed(4)),
          _getButton(text: '5', onTap: () => numberPressed(5)),
          _getButton(text: '6', onTap: () => numberPressed(6)),
          _getButton(
              text: 'tan',
              onTap: () => operatorPressed('tan'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
        ],
      ),
      Row(
        children: [
          _getButton(text: '1', onTap: () => numberPressed(1)),
          _getButton(text: '2', onTap: () => numberPressed(2)),
          _getButton(text: '3', onTap: () => numberPressed(3)),
          _getButton(
              text: 'log',
              onTap: () => operatorPressed('log'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1))
        ],
      ),
      Row(
        children: [
          _getButton(
              text: '=',
              onTap: calculateResult,
              backgroundColor: Colors.orange,
              textColor: Colors.white),
          _getButton(text: '0', onTap: () => numberPressed(0)),
          _getButton(
              text: 'C',
              onTap: clear,
              backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
          _getButton(
              text: '√',
              onTap: () => operatorPressed('√'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
        ],
      ),
    ]);
  }

  Widget _getButton({
    required String text,
    required VoidCallback onTap,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
  }) {
    return SciCalculatorButton(
      label: text,
      onTap: onTap,
      size: width / 4 - 12,
      backgroundColor: backgroundColor,
      labelColor: textColor,
    );
  }

  Widget _getButton1({
    required String text,
    required VoidCallback onTap,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
  }) {
    return SciCalculatorButton(
      label: text,
      onTap: onTap,
      size: width / 4 - 12,
      backgroundColor: backgroundColor,
      labelColor: textColor,
    );
  }

  operatorPressed(String operator) {
    setState(() {
      if (firstOperand == null) {
        firstOperand = 0;
      }
      this.operator = operator;
      //    String $operator = operator;
      // setState(() {
      //   if (firstOperand == null) {
      //     firstOperand = double.parse('$operator');
      //   }
    });
  }

  numberPressed(double number) {
    setState(() {
      if (result != null) {
        result = null;
        firstOperand = number;
        return;
      }
      if (firstOperand == null) {
        firstOperand = number;
        return;
      }
      if (operator == null) {
        firstOperand = double.parse('$firstOperand$number');
        return;
      }
      if (secondOperand == null) {
        secondOperand = number;
        return;
      }
      secondOperand = double.parse('$secondOperand$number');
    });
  }

  calculateResult() {
    if (operator == null || secondOperand == null) {
      return;
    }
    setState(() {
      switch (operator) {
        case 'sin':
          result = sin(secondOperand!);
          break;
        case 'cos':
          result = cos(secondOperand!);
          break;
        case 'tan':
          result = tan(secondOperand!);
          break;
        case 'log':
          result = log(secondOperand!);
          break;
        case '√':
          result = sqrt(secondOperand!);
          break;
      }
      firstOperand = result;
      operator = null;
      secondOperand = null;
      result = null;
    });
  }

  clear() {
    setState(() {
      result = null;
      operator = null;
      secondOperand = null;
      firstOperand = null;
    });
  }

  _getDisplayText() {
    if (result != null) {
      return '$result';
    }
    if (secondOperand != null) {
      return '$operator$secondOperand';
    }
    if (operator != null) {
      return '$operator';
    }
    if (firstOperand != null) {
      return '$firstOperand';
    }
    return '0';
  }
}
