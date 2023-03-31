import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import 'curlocation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child:Text('CHAT'), onPressed:  (){
        Navigator.pushNamed(context, '/chat');
      },backgroundColor: Colors.black,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Column(
                  children: [
                    Text('We are here for you!',style: TextStyle(fontSize: 20)),
                    Text('Hello Chirag',style: TextStyle(fontSize:20,fontWeight: FontWeight.w700),)
                  ],
                ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 90,
                  )],
              ),
              SizedBox(height: 40,),
              BlackButton(buttonText: 'Check your eye', onpress: (){})
                  .buildBlackButton(),
              SizedBox(height: 16,),
              BlackButton(buttonText: 'Nearby eye hospitals', onpress: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return const CurrentLocationScreen();
                }));
              })
                  .buildBlackButton(),
              SizedBox(height: 100,),
              Text('Stats',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),

            ]
          ),
        ),
      ),
    );
  }
}
