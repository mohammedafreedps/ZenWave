import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';

class TextFieldBorder extends StatefulWidget {
  // const TextFieldBorder({super.key});
  final TextEditingController Contollerof ;
  final Function? onchangeof;

  TextFieldBorder(this.Contollerof,{this.onchangeof});


  @override
  State<TextFieldBorder> createState() => _TextFieldBorderState();
}


class _TextFieldBorderState extends State<TextFieldBorder> {
  _refreshPage(){
  setState(() {
    
  });
}

  @override
  Widget build(BuildContext context) {
    return widget.onchangeof != null ?
    TextField(
      onChanged: (value){
        print('onchange wokring');
        widget.onchangeof!(value);
      },
      controller: widget.Contollerof,
      cursorColor: PRIMARY_COLOR,
      decoration: InputDecoration(
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: PRIMARY_COLOR)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR))),
    ) :
    Flexible(
      child: TextField(
        maxLength: null,
        controller: widget.Contollerof,
        cursorColor: PRIMARY_COLOR,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 10),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: PRIMARY_COLOR)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR))),
      ),
    );
  } 
}
