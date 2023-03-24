import 'package:flutter/material.dart';
import 'package:i_doc_app/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/idocfield.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = "";
  String email = "";
  String password = "";
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
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
                  onchange: (change){
                    setState(() {
                      name=change;
                    });
                  },
                  text: name,
                  label: "Name",
                ),
                SizedBox(
                  height: 20,
                ),
                iDocField(
                  onchange: (change){
                    setState(() {
                      email=change;
                    });
                  },
                  text: email,
                  label: "Email",
                ),
                SizedBox(
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
              ],
            ),
            TextButton(onPressed: ()async{
              final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

              // Obtain the auth details from the request
              final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

              // Create a new credential
              final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth?.accessToken,
                idToken: googleAuth?.idToken,
              );

              // Once signed in, return the UserCredential
              await FirebaseAuth.instance.signInWithCredential(credential);
              Navigator.pushNamed(context, '/dashboard');

            }, child: Container(
              child: Text('Login with Google'),
            )),
            SizedBox(
              height: 100,
            ),
            BlackButton(buttonText: 'REGISTER', onpress: () async {
              print(email);
              print(password);
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email,
                    password: password
                );
              Navigator.pushNamed(context, '/dashboard');

            })
                .buildBlackButton()

          ],
        ),
      ),
    );
  }
}
