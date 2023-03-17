
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
                // color: kTextInputColor,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: (change){
                    setState(() {
                      email = change;
                    });
                  },
                ),
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
