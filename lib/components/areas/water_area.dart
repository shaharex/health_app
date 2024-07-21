import 'package:flutter/material.dart';

import '../my_button2.dart';
import '../my_button3.dart';

class WaterArea extends StatefulWidget {
  WaterArea({super.key, required this.water});
  final String water;

  @override
  State<WaterArea> createState() => _WaterAreaState();
}

class _WaterAreaState extends State<WaterArea> {
  final TextEditingController _alarmHoursController = TextEditingController();
  final TextEditingController _alarmMinsController = TextEditingController();

  // show water menu
  void _showFoodMenu(BuildContext context) {
    showMenu(
        shadowColor: Colors.grey,
        context: context,
        position: const RelativeRect.fromLTRB(100, 550, 10, 10),
        items: [
          const PopupMenuItem(
            height: 30,
            value: 1,
            child: Text('Add alarm'),
          ),
        ]).then((value) {
      if (value == 1) {
        _showAlarmInputBox(context);
      }
    });
  }

  // show alarm input box
  void _showAlarmInputBox(BuildContext context) {
    bool isFoodsSelected = false;
    bool isWaterSelected = true;
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

  int waterCurrent = 0;
  void waterAdd(int waterAmount) {
    setState(() {
      waterCurrent += waterAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const Icon(
              Icons.water_drop_outlined,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '${waterCurrent}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                        text: ' / ${widget.water} ml',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton2(
                    text: '+ 100ml',
                    onTap: () => waterAdd(100),
                    width: 50,
                    height: 20,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MyButton2(
                    text: '+ 250ml',
                    onTap: () => waterAdd(250),
                    width: 50,
                    height: 20,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.water,
                color: Color.fromARGB(255, 33, 150, 243),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 45,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  '12.5 %',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
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
