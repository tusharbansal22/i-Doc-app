import 'package:flutter/material.dart';
import 'package:i_doc_app/widgets/idocfield.dart';

import '../widgets/buttons.dart';

class DocLogin extends StatefulWidget {
  const DocLogin({Key? key}) : super(key: key);

  @override
  State<DocLogin> createState() => _DocLoginState();
}

class _DocLoginState extends State<DocLogin> {
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
                      GestureDetector(child: Icon(Icons.arrow_back) ,onTap: (){
                        Navigator.pushNamed(context, '/home');
                      },),
                      Text(
                        'DOCTOR LOGIN',
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
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                iDocField(text: email , label: "Doctor ID",),
                SizedBox(
                  height: 20,
                ),

                iDocField(text: password,isPassword: true, label: "Password",),

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

            SizedBox(height: 100,),
            BlackButton(buttonText: 'LOGIN',onpress: (){}).buildBlackButton(),

          ],
        ),
      ),
    );
  }
}
