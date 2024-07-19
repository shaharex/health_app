import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  GenderBox({
    super.key,
    required this.gender,
    required this.genderText,
    required this.isActive,
    required this.onTap,
  });
  final IconData gender;
  final String genderText;
  final bool isActive;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145,
        height: 145,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(
              color: isActive ? Colors.black : Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              gender,
              size: 95,
            ),
            Text(
              genderText,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
