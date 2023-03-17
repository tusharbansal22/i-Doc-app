import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('assets/images/logo.png')]),
              SizedBox(
                height: 5,
              ),
              Text(
                'i-Doc',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Experience a clearer vision of your eye health with '),
                      TextSpan(
                          text: 'i-Doc',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 250,
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
                  'REGISTER',
                  style: TextStyle(letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Already Registered?"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    ))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
