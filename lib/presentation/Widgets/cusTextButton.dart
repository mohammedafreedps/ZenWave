import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Widgets/cusText.dart';

class cusTextButton extends StatefulWidget {
  final Function toPerform;
  final String text;
  final Color? color;
  cusTextButton(this.toPerform,this.text,{this.color});

  @override
  State<cusTextButton> createState() => _cusTextButtonState();
}

class _cusTextButtonState extends State<cusTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      widget.toPerform();
    }, child: cusText(content: widget.text,fontSize: 18,color: widget.color,));
  }
}