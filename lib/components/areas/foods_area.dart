import 'package:flutter/material.dart';

import '../food_box.dart';
import '../my_button2.dart';
import '../my_button3.dart';

class FoodsArea extends StatefulWidget {
  FoodsArea({super.key});

  @override
  State<FoodsArea> createState() => _FoodsAreaState();
}

class _FoodsAreaState extends State<FoodsArea> {
  final TextEditingController _alarmHoursController = TextEditingController();
  final TextEditingController _alarmMinsController = TextEditingController();

  final List<String> _imagePaths = [
    '/images/breakfast-5204360_640.jpg',
    '/images/burger-987256_640.jpg',
    '/images/food-1050813_640.jpg'
  ];

  final List<String> _foodType = ['Breakfast', 'Lunch', 'Diner'];

  // show food menu
  void _showFoodMenu(BuildContext context) {
    showMenu(
        shadowColor: Colors.grey,
        context: context,
        position: const RelativeRect.fromLTRB(100, 400, 10, 10),
        items: [
          const PopupMenuItem(
            height: 30,
            value: 1,
            child: Text('Add food image'),
          ),
          const PopupMenuItem(
            height: 30,
            value: 2,
            child: Text('Add alarm'),
          ),
        ]).then((value) {
      if (value == 1) {
        _showFoodInputBox(context);
      } else if (value == 2) {
        _showAlarmInputBox(context);
      }
    });
  }

  // show food input box
  void _showFoodInputBox(BuildContext context) {
    bool isBreakfastSelected = false;
    bool isLunchSelected = true;
    bool isDinnerSelected = false;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Add food image'),
            titleTextStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            content: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // breakfast button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isBreakfastSelected = true;
                              isLunchSelected = false;
                              isDinnerSelected = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 75,
                            decoration: BoxDecoration(
                              color: isBreakfastSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            child: Text(
                              'Breakfast',
                              style: TextStyle(
                                color: isBreakfastSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),

                        // lunch button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLunchSelected = true;
                              isBreakfastSelected = false;
                              isDinnerSelected = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 75,
                            decoration: BoxDecoration(
                              color: isLunchSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            child: Text(
                              'Lunch',
                              style: TextStyle(
                                color: isLunchSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),

                        // dinner button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDinnerSelected = true;
                              isBreakfastSelected = false;
                              isLunchSelected = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 75,
                            decoration: BoxDecoration(
                              color: isDinnerSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            child: Text(
                              'Dinner',
                              style: TextStyle(
                                color: isDinnerSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: const Icon(Icons.image),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please select an image area \n You can use the gallery or camera.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, height: 1.0),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyButton3(
                            text: 'Cancel',
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: double.maxFinite,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: MyButton2(
                            text: 'Complete',
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: double.maxFinite,
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  // show alarm input box
  void _showAlarmInputBox(BuildContext context) {
    bool isFoodsSelected = true;
    bool isWaterSelected = false;
    bool isOtherSelected = false;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add alarm"),
          titleTextStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          content: StatefulBuilder(builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // foods alarm type
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFoodsSelected = true;
                          isWaterSelected = false;
                          isOtherSelected = false;
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isFoodsSelected ? Colors.black : Colors.white,
                          border: isFoodsSelected
                              ? null
                              : Border.all(color: Colors.grey),
                        ),
                        child: Icon(
                          Icons.dining_outlined,
                          color: isFoodsSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),

                    // water alarm type
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isWaterSelected = true;
                          isFoodsSelected = false;
                          isOtherSelected = false;
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isWaterSelected ? Colors.black : Colors.white,
                          border: isWaterSelected
                              ? null
                              : Border.all(color: Colors.grey),
                        ),
                        child: Icon(
                          Icons.water_drop_outlined,
                          color: isWaterSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),

                    // heart rate alarm type
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isOtherSelected = true;
                          isWaterSelected = false;
                          isFoodsSelected = false;
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isOtherSelected ? Colors.black : Colors.white,
                          border: isOtherSelected
                              ? null
                              : Border.all(color: Colors.grey),
                        ),
                        child: Icon(
                          Icons.more_horiz,
                          color: isOtherSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: _alarmHoursController,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Text(
                      'hours',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                        width: 40,
                        child: TextField(
                          controller: _alarmMinsController,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                          keyboardType: TextInputType.number,
                        )),
                    const Text(
                      'mins',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: MyButton3(
                        text: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        width: double.maxFinite,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyButton2(
                        text: 'Complete',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        width: double.maxFinite,
                      ),
                    )
                  ],
                ),
              ],
            );
          }),
        );
      },
    );
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
