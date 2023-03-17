import 'package:flutter/material.dart';

class BlackButton {
  late String buttonText;

  BlackButton({required this.buttonText});

  ElevatedButton buildBlackButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          elevation: 5.0,
          minimumSize: Size(230, 50),
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: () {},
      child: Text(
        buttonText,
        style: TextStyle(letterSpacing: 2),
      ),
    );
  }
}
