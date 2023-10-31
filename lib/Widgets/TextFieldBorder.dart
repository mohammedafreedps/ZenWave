import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';

class TextFieldBorder extends StatefulWidget {
  // const TextFieldBorder({super.key});
  final TextEditingController Contollerof ;
  final Function? onchangeof;

  TextFieldBorder(this.Contollerof,{this.onchangeof});


  @override
  State<TextFieldBorder> createState() => _TextFieldBorderState();
}

class _TextFieldBorderState extends State<TextFieldBorder> {
  @override
  Widget build(BuildContext context) {
    return widget.onchangeof != null ?
    TextField(
      onChanged: (value){
        print('onchange wokring');
        widget.onchangeof!();
      },
      controller: widget.Contollerof,
      cursorColor: primaryColor,
      decoration: InputDecoration(
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor))),
    ) :
    TextField(
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
