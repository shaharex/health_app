import 'package:flutter/material.dart';

class CompetitorInfoArea extends StatelessWidget {
  CompetitorInfoArea({
    super.key,
    required this.gender,
    required this.height,
    required this.weight,
  });

  final String gender;
  final String height;
  final String weight;

  @override
  Widget build(BuildContext context) {
    double bmiHeight = double.parse(height) * 0.01;
    double bmiWeight = double.parse(weight);

    double bmiResult = bmiWeight / (bmiHeight * bmiHeight);

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
          Icon(
            gender == 'male' ? Icons.man : Icons.woman,
            size: 60,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              const SizedBox(
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
                          height,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 1,
                      height: 35,
                      color: Colors.black,
                    ),

                    // weight
                    Column(
                      children: [
                        Text(
                          weight,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'kg',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 1,
                      height: 35,
                      color: Colors.black,
                    ),
                    // bmi
                    Column(
                      children: [
                        Text(
                          bmiResult.toString().substring(0, 4),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
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
                  borderRadius: BorderRadius.circular(15),
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
