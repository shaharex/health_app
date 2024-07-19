import 'package:flutter/material.dart';

import '../components/food_box.dart';

class FoodsArea extends StatelessWidget {
  FoodsArea({super.key});

  final List<String> _imagePaths = [
    '/images/breakfast-5204360_640.jpg',
    '/images/burger-987256_640.jpg',
    '/images/food-1050813_640.jpg'
  ];

  final List<String> _foodType = ['Breakfast', 'Lunch', 'Diner'];

  void _showFoodMenu(BuildContext context) {
    showMenu(
        shadowColor: Colors.grey,
        context: context,
        position: const RelativeRect.fromLTRB(100, 400, 10, 10),
        items: [
          const PopupMenuItem(child: Text('Add food image')),
          const PopupMenuItem(child: Text('Add alarm')),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const Icon(
              Icons.dining_outlined,
            ),
          ),
          SizedBox(
            width: 180,
            height: 65,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 15,
                );
              },
              itemCount: _foodType.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FoodBox(
                  imagePath: _imagePaths[index],
                  foodType: _foodType[index],
                );
              },
            ),
          ),
          IconButton(
            onPressed: () => _showFoodMenu(context),
            icon: const Icon(
              Icons.more_vert,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
