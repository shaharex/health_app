import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_health_data_worldskills/components/my_button1.dart';
import 'package:my_health_data_worldskills/components/my_button2.dart';
import 'package:my_health_data_worldskills/components/my_button3.dart';
import 'package:my_health_data_worldskills/components/my_textfield.dart';

import '../services/user.dart';
import 'profile_and_target_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // sign in controllers
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // coming soon
  void _comingSoonSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Coming soon...'),
      duration: Duration(seconds: 1),
    ));
  }

  // auth API
  late Future<List<User>> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = getUser(context);
  }

  static Future<List<User>> getUser(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('/auth.json');

    final body = jsonDecode(data);
    return body.map<User>((json) => User.fromJson(json)).toList();
  }

  bool _isSignedIn = false;

  void signIn() {
    userFuture.then((users) {
      final username = _userNameController.text;
      final password = _passwordController.text;

      final user = users.firstWhere(
        (user) =>
            user.mberId == username && user.mberPassword.toString() == password,
      );

      if (user != null) {
        setState(() {
          _isSignedIn = true;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfileAndTargetPage(
                      username: user.mberId,
                    )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Invalid username or password'),
        ));
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Fill the form with correct information'),
      ));
    });
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
                    onTap: signIn,
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
