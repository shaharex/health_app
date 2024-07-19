import 'package:flutter/material.dart';

class FoodBox extends StatelessWidget {
  const FoodBox({super.key, required this.imagePath, required this.foodType});
  final String imagePath;
  final String foodType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      height: 60,
      width: 60,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 50,
              top: 0,
            ),
            alignment: Alignment.topRight,
            child: const Icon(
              size: 20,
              Icons.cancel,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              foodType,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
