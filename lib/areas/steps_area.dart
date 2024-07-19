import 'package:flutter/material.dart';

class StepsArea extends StatelessWidget {
  const StepsArea({super.key});

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 8,
              ),
              Text(
                '2745',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                '/ 5,000 Steps',
                style: TextStyle(fontSize: 14),
              )
            ],
          ),

          //
          Container(
            height: 15,
            width: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    colors: [Color.fromARGB(146, 4, 154, 9), Colors.green])),
          ),
        ],
      ),
    );
  }
}
