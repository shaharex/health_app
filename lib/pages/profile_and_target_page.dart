import 'package:flutter/material.dart';
import 'package:my_health_data_worldskills/components/gender_box.dart';
import 'package:my_health_data_worldskills/components/my_button1.dart';
import 'package:my_health_data_worldskills/components/my_button2.dart';
import 'package:my_health_data_worldskills/components/my_button3.dart';
import 'package:my_health_data_worldskills/components/my_textfield.dart';

import 'navigation_page.dart';

class ProfileAndTargetPage extends StatefulWidget {
  const ProfileAndTargetPage({super.key});

  @override
  State<ProfileAndTargetPage> createState() => _ProfileAndTargetPageState();
}

class _ProfileAndTargetPageState extends State<ProfileAndTargetPage> {
  // profile and target screen textfields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _stepsController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();

  // input box
  final TextEditingController _heightInputBoxController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _birthdayController.dispose();
    _stepsController.dispose();
    _waterController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  bool isActiveMale = true;
  bool isActiveFemale = false;
  String chosenGender = 'male';

  // show Height InputBox
  void _showHeightInputBox(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tall',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _heightInputBoxController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Your height',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text('cm'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyButton3(
                        text: 'Cancel',
                        onTap: () {
                          _heightController.clear();
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
                          setState(() {
                            _heightController.text =
                                _heightInputBoxController.text;
                          });
                          Navigator.pop(context);
                        },
                        width: double.maxFinite,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  // show Weight InputBox
  void _showWeightInputBox(BuildContext context) {
    int weightBigUnit = 0;
    int weightUnit = 0;
    double weightTotal = 0;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Weight',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 50,
                      child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (index) {
                            setState(() {
                              weightBigUnit = ++index;
                            });
                          },
                          itemExtent: 50,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 100,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  '${1 + index}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                    const Text(
                      '.',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 90,
                      width: 50,
                      child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (index) => {
                                setState(() {
                                  weightUnit = index;
                                })
                              },
                          itemExtent: 50,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 10,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  '${0 + index}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                    const Text(
                      'kg',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyButton3(
                        text: 'Cancel',
                        onTap: () {
                          _weightController.clear();
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
                          setState(() {
                            weightTotal = weightBigUnit + (weightUnit * 0.1);
                            _weightController.text = (weightTotal).toString();
                          });
                          Navigator.pop(context);
                        },
                        width: double.maxFinite,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  // show Steps InputBox
  void _showStepsInputBox(BuildContext context) {
    int stepsOverall = 1000;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Steps',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      height: 90,
                      width: 60,
                      child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (index) {
                            setState(() {
                              stepsOverall = 1000 + index;
                            });
                          },
                          itemExtent: 50,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 10000,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  '${1000 + index}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                    const Text(
                      'Steps',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyButton3(
                        text: 'Cancel',
                        onTap: () {
                          _stepsController.clear();
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
                          setState(() {
                            _stepsController.text = stepsOverall.toString();
                          });
                          Navigator.pop(context);
                        },
                        width: double.maxFinite,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  // show Water InputBox
  void _showWaterInputBox(BuildContext context) {
    int waterOverall = 1000;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Water',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 90,
                      width: 60,
                      child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (index) {
                            setState(() {
                              waterOverall = 1000 + index;
                            });
                          },
                          itemExtent: 50,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 10000,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  '${1000 + index}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                    const Text(
                      'ml',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyButton3(
                        text: 'Cancel',
                        onTap: () {
                          _waterController.clear();
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
                          setState(() {
                            _waterController.text = waterOverall.toString();
                          });
                          Navigator.pop(context);
                        },
                        width: double.maxFinite,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        iconTheme: const IconThemeData(color: Colors.white, size: 20),
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Profile & Target',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi, username',
              style: TextStyle(fontSize: 24),
            ),

            // profile
            const Text(
              'Profile,',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(
              height: 5,
            ),

            // gender box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderBox(
                  gender: Icons.man,
                  genderText: 'Male',
                  isActive: isActiveMale,
                  onTap: () {
                    setState(() {
                      isActiveFemale = false;
                      isActiveMale = true;
                      chosenGender = 'male';
                    });
                  },
                ),
                GenderBox(
                  gender: Icons.woman,
                  genderText: 'Female',
                  isActive: isActiveFemale,
                  onTap: () {
                    setState(() {
                      isActiveFemale = true;
                      isActiveMale = false;
                      chosenGender = 'Female';
                    });
                  },
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            // textfields profile

            // username
            MyTextField(
              hintText: 'Username',
              controller: _userNameController,
              prefixIcon: Icons.person,
            ),
            const SizedBox(
              height: 5,
            ),

            // height
            MyTextField(
              hintText: 'Height',
              controller: _heightController,
              prefixIcon: Icons.height,
              suffixText: 'Cm',
              onTap: () => _showHeightInputBox(context),
            ),
            const SizedBox(
              height: 5,
            ),

            // weight
            MyTextField(
              hintText: 'Weight',
              controller: _weightController,
              prefixIcon: Icons.monitor_weight,
              suffixText: 'Kg',
              onTap: () => _showWeightInputBox(context),
            ),
            const SizedBox(
              height: 5,
            ),

            // b-day
            MyTextField(
              hintText: 'Birthday',
              controller: _birthdayController,
              prefixIcon: Icons.cake_outlined,
            ),

            // target
            const Text(
              'Target,',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(
              height: 5,
            ),

            // target textfields
            MyTextField(
              hintText: 'Steps',
              controller: _stepsController,
              prefixIcon: Icons.directions_walk_outlined,
              suffixText: 'Steps',
              onTap: () => _showStepsInputBox(context),
            ),
            const SizedBox(
              height: 5,
            ),
            MyTextField(
              hintText: 'Water',
              controller: _waterController,
              prefixIcon: Icons.water_drop,
              suffixText: 'ml',
              onTap: () => _showWaterInputBox(context),
            ),
            const SizedBox(
              height: 10,
            ),

            // button
            MyButton1(
              text: 'Complete',
              onTap: () {
                if (_birthdayController.text.isNotEmpty &&
                    _heightController.text.isNotEmpty &&
                    _stepsController.text.isNotEmpty &&
                    _weightController.text.isNotEmpty &&
                    _waterController.text.isNotEmpty &&
                    _userNameController.text.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationPage(
                              // gender: chosenGender,
                              // username: _userNameController.text,
                              // height: _heightController.text,
                              // weight: _weightController.text,
                              // birthday: _birthdayController.text,
                              // steps: _stepsController.text,
                              // water: _waterController.text,
                              )));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Fill all fields')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
