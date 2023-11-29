import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Widgets/cusText.dart';

class FutureTaskViewPage extends StatefulWidget {
  final String task;
  final int day;
  final int month;
  final int year;
  final int hour;
  final int minutes;

  FutureTaskViewPage(
      {required this.task,
      required this.day,
      required this.month,
      required this.year,
      required this.hour,
      required this.minutes});

  @override
  State<FutureTaskViewPage> createState() => _FutureTaskViewPageState();
}

class _FutureTaskViewPageState extends State<FutureTaskViewPage> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      cusText(
                        content: widget.day.toString() +
                            '-' +
                            widget.month.toString() +
                            '-' +
                            widget.year.toString(),
                      ),
                      cusText(
                          content: widget.hour.toString() +
                              '-' +
                              widget.minutes.toString()),
                    SizedBox(height: 30,),
                      Text(
                        'Tasks',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(widget.task),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
