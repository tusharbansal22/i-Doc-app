import 'package:flutter/material.dart';

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
            TextField(
              onChanged: (change){
                setState(() {
                  email = change;
                });
              },
            ),
            TextField(
              obscureText: true,
              onChanged: (change){
                setState(() {
                  password = change;
                });
              },
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
