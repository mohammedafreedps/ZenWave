import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';

class TextFieldBorder extends StatefulWidget {
  // const TextFieldBorder({super.key});
  TextEditingController Contollerof ;

  TextFieldBorder(this.Contollerof);


  @override
  State<TextFieldBorder> createState() => _TextFieldBorderState();
}

class _TextFieldBorderState extends State<TextFieldBorder> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.Contollerof,
      cursorColor: primaryColor,
      decoration: InputDecoration(
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor))),
    );
  } 
}
