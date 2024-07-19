import 'package:flutter/material.dart';
import 'package:my_health_data_worldskills/components/my_button1.dart';
import 'package:my_health_data_worldskills/components/my_button2.dart';
import 'package:my_health_data_worldskills/components/my_button3.dart';
import 'package:my_health_data_worldskills/components/my_textfield.dart';

import 'profile_and_target_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _comingSoonSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Coming soon...'),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Health Data',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // logo and text
              Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset('/logo_symbol/symbol.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please enter your information.',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                  ),
                ],
              ),

              // username and password textfield
              Column(
                children: [
                  MyTextField(
                    hintText: 'Username',
                    controller: _userNameController,
                    prefixIcon: Icons.person,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    hintText: 'Password',
                    controller: _passwordController,
                    prefixIcon: Icons.lock,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // sign in button
                  MyButton1(
                    text: 'Sign in',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileAndTargetPage()));
                    },
                  ),
                ],
              ),

              // sign up & password buttons
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyButton2(
                      text: 'Sign up',
                      onTap: () => _comingSoonSnackBar(context),
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyButton3(
                        text: 'Password Reset',
                        onTap: () => _comingSoonSnackBar(context),
                        width: double.infinity),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
