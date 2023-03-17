import 'package:flutter/material.dart';
import 'package:i_doc_app/constants.dart';
import 'package:i_doc_app/widgets/idocfield.dart';

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
                'Login',
                style: TextStyle(letterSpacing: 2),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text('Doctor Login',style: TextStyle(decoration: TextDecoration.underline),),
            ),
          ],
        ),
      ),
    );
  }
}



