import 'package:flutter/material.dart';
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
        width: 330,
        color: FILL_COLOR,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 20,right: 10,bottom: 10),
          child: TextField(
            controller: widget.controller,
            cursorColor: PRIMARY_COLOR,
            decoration: InputDecoration(
              hintText: 'Enter your Name',
              floatingLabelAlignment: FloatingLabelAlignment.center,
              border: InputBorder.none
            ),
        
          ),
        ),
      ),
    );
  }
}