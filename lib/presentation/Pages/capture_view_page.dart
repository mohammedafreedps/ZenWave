import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';

class CaptureViewPage extends StatefulWidget {
  final String imgPath;
  final String title;
  final String content;
  final int day;
  final int month;
  final int year;
  const CaptureViewPage(
      this.imgPath, this.title, this.content, this.day, this.month, this.year);

  @override
  State<CaptureViewPage> createState() => CaptureViewPageState();
}

class CaptureViewPageState extends State<CaptureViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: BASE_COLOR,
        elevation: 0,
      ),
      body: Container(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        color: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.all(PAGE_PADDING),
          child: Container(
            child: Column(
              children: [
                PhysicalModel(
                  color: DROPSHADOW_COLOR,
                  elevation: Elevetion,
                  child: Container(
                    color: PRIMARY_COLOR,
                    width: SCREEN_WIDTH,
                    height: 300,
                    child: Image.file(File(widget.imgPath)),
                  ),
                ),
                SizedBox(height: 40,),
                Text('Date: ' +
                    widget.day.toString() +
                    ' - ' +
                    widget.month.toString() +
                    ' - ' +
                    widget.year.toString()),
                    SizedBox(height: 40,),
                Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Text(widget.content)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
