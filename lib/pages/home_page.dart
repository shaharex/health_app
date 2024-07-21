import 'package:flutter/material.dart';
import 'package:my_health_data_worldskills/components/areas/competitor_info_area.dart';
import 'package:my_health_data_worldskills/components/areas/foods_area.dart';
import 'package:my_health_data_worldskills/components/areas/heart_rate_area.dart';
import 'package:my_health_data_worldskills/components/areas/steps_area.dart';
import 'package:my_health_data_worldskills/components/areas/water_area.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
    required this.gender,
    required this.username,
    required this.height,
    required this.weight,
    required this.steps,
    required this.water,
  });

  final String gender;
  final String username;
  final String height;
  final String weight;
  final String steps;
  final String water;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // hello part
          Text(
            'Hello, $username',
            style: const TextStyle(fontSize: 22),
          ),
          CompetitorInfoArea(
            gender: gender,
            height: height,
            weight: weight,
          ),

          // steps part
          const Text(
            'Steps',
            style: TextStyle(fontSize: 22),
          ),
          StepsArea(steps: steps),

          // heart rate
          const Text(
            'Heart Rate',
            style: TextStyle(fontSize: 22),
          ),
          HeartRateArea(),

          // foods
          const Text(
            'Foods',
            style: TextStyle(fontSize: 22),
          ),
          FoodsArea(),

          // water
          const Text(
            'Water',
            style: TextStyle(fontSize: 22),
          ),
          WaterArea(
            water: water,
          ),
        ],
      ),
    );
  }
}
