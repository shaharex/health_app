import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  MyButton2({
    super.key,
    required this.text,
    required this.onTap,
    required this.width,
    this.height,
    this.textStyle,
  });
  final String text;
  final Function()? onTap;
  final double width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black,
        ),
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
