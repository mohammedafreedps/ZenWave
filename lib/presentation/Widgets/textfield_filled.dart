import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';

class TextFieldFilled extends StatefulWidget {
  // const TextFieldFilled({super.key});
  final TextEditingController controller;
  TextFieldFilled(this.controller);

  @override
  State<TextFieldFilled> createState() => _TextFieldFilledState();
}

class _TextFieldFilledState extends State<TextFieldFilled> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
      child: Container(
        width: LOGIN_CONTAINER_WIDTH! * 0.9,
        height: LGOIN_BUTTON_HEIGHT,
        color: FILL_COLOR,
        child: Padding(
          padding: EdgeInsets.only(top: LOGIN_CONTAINER_WIDTH!*0.02,left: 20,right: LOGIN_CONTAINER_WIDTH!*0.05,bottom: LOGIN_CONTAINER_WIDTH!*0.02),
          child: TextField(
            controller: widget.controller,
            cursorColor: PRIMARY_COLOR,
            decoration: InputDecoration(
              hintText: 'Enter your Name',
              hintStyle: TextStyle(fontSize:  LOGIN_CONTAINER_WIDTH!*0.05),
              floatingLabelAlignment: FloatingLabelAlignment.center,
              border: InputBorder.none
            ),
        
          ),
        ),
      ),
    );
  }
}