import 'package:flutter/material.dart';
import 'package:i_doc_app/screens/chat.dart';
import 'package:i_doc_app/screens/curlocation.dart';
import 'package:i_doc_app/screens/dashboard.dart';
import 'package:i_doc_app/screens/doctorlog.dart';
import 'package:i_doc_app/screens/login.dart';
import 'package:i_doc_app/screens/nearby_places.dart';
import 'package:i_doc_app/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/init_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize
//   await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp( MyApp());
//...
}


class MyApp extends StatelessWidget {

  String inRoute= '/home';
  @override
  initState() {

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        inRoute='/dashboard';
        print('User is signed in!');
      }
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: inRoute,
        routes: {
          '/login': (context) => Login(),
          '/doclog': (context) => DocLogin(),
          '/register': (context) => Register(),
          '/home': (context) => InitScreen(),
          '/dashboard': (context)=> Dashboard(),
          '/chat': (context)=> ChatScreen(),
          '/loc':(context)=>CurrentLocationScreen(),
          '/nearbyplaces':(context)=>NearbyPlaces()
        },
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InitScreen());
  }
}
