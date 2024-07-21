import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  const MyListTile({
    super.key,
    required this.icon,
    required this.timeHour,
    required this.timeMin,
  });

  final IconData icon;
  final int timeHour;
  final int timeMin;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool alarmValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.timeHour <= 9
                    ? '0${widget.timeHour}:${widget.timeMin}0'
                    : '${widget.timeHour}:${widget.timeMin}0',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
              )
            ],
          ),
          CupertinoSwitch(
            activeColor: Colors.black,
            value: alarmValue,
            onChanged: (value) {
              setState(() {
                alarmValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
