import 'package:flutter/material.dart';
import 'package:i_doc_app/widgets/idocfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/buttons.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        child: const Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                      const Text(
                        'LOGIN',
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
                    const Text(
                      "i-Doc",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                  ]),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                iDocField(
                  onchange: (change){
                    setState(() {
                      email=change;
                    });
                  },
                  text: email,
                  label: "Email",
                ),
                const SizedBox(
                  height: 20,
                ),
                iDocField(
                  onchange: (change){
                    setState(() {
                      password=change;
                    });
                  },
                  text: password,
                  isPassword: true,
                  label: "Password",
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 33.0, vertical: 10),
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
            const SizedBox(
              height: 80,
            ),
            BlackButton(buttonText: 'LOGIN', onpress: () async {
              try {
                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password
                );
                Navigator.pushNamed(context, '/dashboard');
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
            }).buildBlackButton(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/doclog');
              },
              child: const Text(
                'Doctor Login',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
