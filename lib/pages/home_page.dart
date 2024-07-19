import 'package:flutter/material.dart';
import 'package:my_health_data_worldskills/areas/competitor_info_area.dart';
import 'package:my_health_data_worldskills/areas/foods_area.dart';
import 'package:my_health_data_worldskills/areas/heart_rate_area.dart';
import 'package:my_health_data_worldskills/areas/steps_area.dart';
import 'package:my_health_data_worldskills/areas/water_area.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // hello part
          const Text(
            'Hello, Competitor99',
            style: TextStyle(fontSize: 22),
          ),
          CompetitorInfoArea(),

          // steps part
          const Text(
            'Steps',
            style: TextStyle(fontSize: 22),
          ),
          StepsArea(),

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
          WaterArea(),
        ],
      ),
    );
  }
}
