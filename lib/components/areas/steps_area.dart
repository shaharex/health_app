import 'dart:math';

import 'package:flutter/material.dart';

class StepsArea extends StatefulWidget {
  const StepsArea({super.key, required this.steps});

  final String steps;

  @override
  State<StepsArea> createState() => _StepsAreaState();
}

class _StepsAreaState extends State<StepsArea> {
  int stepsAdd(int steps) {
    int stepsRandom = Random().nextInt(steps) + 500;

    return stepsRandom;
  }

  @override
  Widget build(BuildContext context) {
    int stepsReal = int.parse(widget.steps);

    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                stepsAdd(stepsReal).toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                '/ ${widget.steps} Steps',
                style: const TextStyle(fontSize: 14),
              )
            ],
          ),

          //
          Stack(
            children: [
              Container(
                height: 15,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade500,
                ),
              ),
              Container(
                height: 15,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(146, 4, 154, 9),
                      Colors.green
                    ])),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
