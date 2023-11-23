import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/values.dart';

class CustomisableButton extends StatelessWidget {
  final double _width;
  final double _height;
  final double _fontSize;
  final Color _backColor;
  final Color _textColor;
  final String text;
  final bool needDropshadow;
  final Function? toPerform;
  final Widget? go;
  final String? HowToGO;

  CustomisableButton(this._width, this._height, this._backColor,
      this._textColor, this.text, this._fontSize, this.needDropshadow,
      {this.toPerform, this.go, this.HowToGO});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (toPerform != null) {
          toPerform!();
        }
        switch (HowToGO) {
          case 'push':
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return go!;
            }));
            break;
          case 'pushReplace':
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return go!;
            }));
            break;
          case 'pop':
            Navigator.pop(context);
            break;

          default:
        }
      },
      child: PhysicalModel(
        color: PRIMARY_COLOR,
        elevation: needDropshadow ? Elevetion : 0,
        borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
        child: Container(
          width: _width,
          height: _height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
            child: Container(
              width: _width,
              height: _height,
              color: _backColor,
              child: Center(
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: _textColor, fontSize: _fontSize),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
