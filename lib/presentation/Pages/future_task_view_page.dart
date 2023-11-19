import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';

class FutureTaskViewPage extends StatefulWidget {
  final String task;
  FutureTaskViewPage(this.task);

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
                  Text(
                    'Tasks',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(widget.task),
                ],
              ),
              CustomisableButton(150, 40, SECONDARY_COLOR, PRIMARY_COLOR,
                  'Completed', 20, false)
            ],
          ),
        ),
      ),
    );
  }
}
