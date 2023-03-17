import 'package:flutter/material.dart';
import 'package:i_doc_app/constants.dart';

class iDocField extends StatefulWidget {
  String text="";
  bool isPassword=false;
  iDocField({required this.text , this.isPassword=false});
  @override
  State<iDocField> createState() => _iDocFieldState();
}

class _iDocFieldState extends State<iDocField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: kTextInputPadding,
      decoration: kTextInputDecoration,
      child: TextField(
        obscureText: widget.isPassword,
        decoration: widget.isPassword?kPasswordFieldDecoration:kInputFieldDecoration,
        onChanged: (change) {
          setState(() {
            widget.text = change;
          });
        },
      ),
    );
  }
}