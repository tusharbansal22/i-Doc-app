import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/idocfield.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back),
                      Text(
                        'Registration',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                  Column(children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 90,
                    ),
                    Text(
                      "i-Doc",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    )
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                iDocField(text: name),
                SizedBox(
                  height: 20,
                ),
                iDocField(text: email),
                SizedBox(
                  height: 20,
                ),
                iDocField(
                  text: password,
                  isPassword: true,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: kBlackButton,
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'REGISTER',
                style: TextStyle(letterSpacing: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
