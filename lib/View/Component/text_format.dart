import 'package:flutter/material.dart';

class TextFormat extends StatelessWidget{

  final String text;
  final TextStyle? style;

  const TextFormat(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 4.0, 4.0, 5.0),
      child: Text(text, style: style),
    );
  }
}