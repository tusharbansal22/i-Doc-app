import 'package:flutter/material.dart';
import 'package:i_doc_app/screens/doctorlog.dart';
import 'package:i_doc_app/screens/login.dart';
import 'package:i_doc_app/screens/register.dart';

import 'screens/init_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/home',
        routes: {
          '/login': (context) => Login(),
          '/doclog': (context) => DocLogin(),
          '/register': (context) => Register(),
          '/home': (context) => InitScreen()
        },
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InitScreen());
  }
}
