import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';

class CaptureCard extends StatefulWidget {
  final String imgPath;
  final String title;
  final int day;
  final int month;
  final int year;

  CaptureCard(this.imgPath,this.title,this.day,this.month,this.year);

  @override
  State<CaptureCard> createState() => _CaptureCardState();
}

class _CaptureCardState extends State<CaptureCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: PhysicalModel(
        color: DROPSHADOW_COLOR,
        elevation: Elevetion,
        borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
          child: Container(
            color: SECONDARY_COLOR,
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.day.toString() + ' - ' + widget.month.toString() + ' - ' + widget.year.toString()),
                SizedBox(height: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 300,
                    color: PRIMARY_COLOR,
                    child: Image.file(File(widget.imgPath),fit: BoxFit.cover,)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.title)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
