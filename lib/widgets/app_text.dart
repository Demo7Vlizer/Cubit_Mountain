// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  const AppText({
    super.key,
    this.size = 16,
    required this.text,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color, fontSize: size));
  }
}

//---------------------------