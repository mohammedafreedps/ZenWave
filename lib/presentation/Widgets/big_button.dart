import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';

// ignore: must_be_immutable
class BigButton extends StatelessWidget {
  // const BigButton({super.key});

  String _Title ;
  Color _backColor;
  Color _textColor;

  BigButton(this._Title,this._backColor,this._textColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: DROPSHADOW_COLOR,
              offset: DROP_OFFSET,
              spreadRadius: DROP_SPREAD,
              blurRadius: DROP_BLUR_RADIOUS
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
          child: Container(
            width: double.infinity,
            height: 300,
            color: _backColor,
            child: Center(
              child: Text(_Title,style: TextStyle(color: _textColor,fontSize: 20),),
            ),
          ),
        ),
      ),
    );
  }
}