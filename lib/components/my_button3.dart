import 'package:flutter/material.dart';

class MyButton3 extends StatelessWidget {
  MyButton3(
      {super.key,
      required this.text,
      required this.onTap,
      required this.width});
  final String text;
  final Function()? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: const Color.fromARGB(255, 184, 184, 184), width: 1.5),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
