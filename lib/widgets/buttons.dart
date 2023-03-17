import 'package:flutter/material.dart';

class BlackButton {
  late String buttonText;
  Function() onpress;

  BlackButton({required this.buttonText, required this.onpress});

  ElevatedButton buildBlackButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          elevation: 5.0,
          minimumSize: Size(230, 50),
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: this.onpress,
      child: Text(
        buttonText,
        style: TextStyle(letterSpacing: 2),
      ),
    );
  }
}
