import 'package:flutter/material.dart';

class CompetitorInfoArea extends StatelessWidget {
  const CompetitorInfoArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.man,
            size: 60,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              // height weight bmi values
              SizedBox(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // height
                    Column(
                      children: [
                        Text(
                          '182',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 1,
                      height: 35,
                      color: Colors.black,
                    ),

                    // weight
                    Column(
                      children: [
                        Text(
                          '80.5',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'kg',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 1,
                      height: 35,
                      color: Colors.black,
                    ),
                    // bmi
                    Column(
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'bmi',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              Container(
                width: 220,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.red,
                      Colors.orange,
                      Colors.green,
                      Colors.blue,
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
