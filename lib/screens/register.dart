import 'package:flutter/material.dart';

import '../widgets/idocfield.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name="";
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
                      Text('LOGIN', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24,letterSpacing: 4),),
                    ],
                  ),
                  Column(children:[ Image.asset('assets/images/logo.png',width: 90,),Text("i-Doc",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),)]),
                ],
              ),
            ),
            SizedBox(height: 40,),
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
                iDocField(text: password,isPassword: true,),
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
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 5.0,
                  minimumSize: Size(230, 50),
                  textStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {},
              child: Text(
                'Register',
                style: TextStyle(letterSpacing: 2),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
