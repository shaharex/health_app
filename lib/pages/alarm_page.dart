import 'dart:math';

import 'package:flutter/material.dart';

import '../components/my_list_tile.dart';

class AlarmPage extends StatelessWidget {
  AlarmPage({super.key});

  final List<IconData> _iconsAlarm = [
    Icons.water_drop_outlined,
    Icons.more_horiz,
    Icons.dining_outlined,
  ];

  int randomIcon = Random().nextInt(2) + 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alarms',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: _iconsAlarm.length,
                  itemBuilder: (context, index) {
                    return MyListTile(
                      icon: _iconsAlarm[Random().nextInt(3) + 0],
                      timeHour: Random().nextInt(24) + 1,
                      timeMin: Random().nextInt(5) + 0,
                    );
                  }),
            ),
          ],
        ));
  }
}
