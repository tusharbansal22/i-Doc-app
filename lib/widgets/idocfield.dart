import 'package:flutter/material.dart';
import 'package:i_doc_app/constants.dart';

class iDocField extends StatefulWidget {
  String text="";
  bool isPassword=false;
  String label="";
  Function onchange;
  iDocField({required this.text , this.isPassword=false , required this.label, required this.onchange});
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
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.black54),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: (change) {
          widget.onchange(change);
        }

      ),
    );
  }
}