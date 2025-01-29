// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_app/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {
  final Color color;
  final String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool isIcon;
  final Function()? onTap;

  AppButtons({
    Key? key,
    required this.color,
    this.text = "hi",
    this.icon,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
        child: isIcon == false
            ? Center(child: AppText(text: text!, color: color))
            : Icon(icon, color: color),
      ),
    );
  }
}
