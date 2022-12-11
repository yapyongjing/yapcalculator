import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  String text;
  ResultDisplay({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.black,
      child: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 34),
        ),
      ),
    );
  }
}
