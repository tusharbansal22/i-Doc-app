
import 'package:flutter/material.dart';
import 'package:i_doc_app/constants.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email="";
  String password="";
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
                width: 330,
                padding: kTextInputPadding,
                decoration: kTextInputDecoration,
                child: TextField(
                  decoration: kInputFieldDecoration,
                  onChanged: (change){
                    setState(() {
                      email = change;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 330,
                padding: kTextInputPadding,
                decoration: kTextInputDecoration,
                child: TextField(
                  obscureText: true,
                  decoration: kPasswordFieldDecoration,
                  onChanged: (change){
                    setState(() {
                      password = change;
                    });
                  },
                ),
              ),
              GestureDetector(onTap: (){},child: Text('Forgot Password?'),),
              TextButton(onPressed: (){}, child: Container(
                child: Text('LOGIN'),
              )),
              GestureDetector(onTap: (){},child: Text('Doctor Login'),),

            ],
        ),
    );
  }
}
