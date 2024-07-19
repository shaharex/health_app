import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.prefixIcon,
      this.suffixText,
      this.onTap});
  final String hintText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final String? suffixText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          onTap: onTap,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                )),
            prefixIcon: Icon(
              prefixIcon,
              color: const Color.fromARGB(255, 147, 147, 147),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
        ),
        Positioned(
            right: 10,
            top: 15,
            child: Text(
              suffixText ?? '',
              style: const TextStyle(fontSize: 16),
            )),
      ],
    );
  }
}
