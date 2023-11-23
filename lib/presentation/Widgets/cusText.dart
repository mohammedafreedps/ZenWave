

import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';

class cusText extends StatelessWidget {
  final String content;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  const cusText({required this.content,this.fontSize,this.color,this.textAlign});

  @override
  Widget build(BuildContext context) {
    Color colr = PRIMARY_COLOR;
    if (color != null) {
      colr = color!;
    }
    return Text(content,style: TextStyle(fontSize: fontSize,color: colr),textAlign: textAlign);
  }
}