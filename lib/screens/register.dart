import 'package:flutter/material.dart';
import 'package:i_doc_app/widgets/buttons.dart';

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
                      GestureDetector(
                        child: Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                      Text(
                        'REGISTER',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            letterSpacing: 4),
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
                iDocField(
                  text: name,
                  label: "Name",
                ),
                SizedBox(
                  height: 20,
                ),
                iDocField(
                  text: email,
                  label: "Email",
                ),
                SizedBox(
                  height: 20,
                ),
                iDocField(
                  text: password,
                  isPassword: true,
                  label: "Password",
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            BlackButton(buttonText: 'REGISTER', onpress: () {})
                .buildBlackButton()
          ],
        ),
      ),
    );
  }
}