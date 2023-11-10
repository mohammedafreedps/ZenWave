import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/DB/Boxes.dart';
import 'package:zenwave/Pages/SetDayWorkPage.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/futureTaskListview.dart';

class FutureWorkPlanPage extends StatefulWidget {
  const FutureWorkPlanPage({super.key});

  @override
  State<FutureWorkPlanPage> createState() => _FutureWorkPlanPageState();
}

class _FutureWorkPlanPageState extends State<FutureWorkPlanPage> {
  List _allTask = [];
  List _task = [];

_testRefresh() {
  print('refresh supposed to work');
  Future.delayed(Duration(milliseconds: 100), () {
    setState(() {
      _allTask = futureTaskBox.values.toList();
    });
  });
}


_getFutureTaskAllDataFromDB() async {
  _task = await futureTaskBox.values.toList();
  print('supposed to work');
  _allTask = _task;
  _testRefresh();
}



  @override
  void initState() {
    _getFutureTaskAllDataFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('widget rebuild sup');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: baseColor,
        child: Padding(
          padding: EdgeInsets.all(PagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomisableButton(
                double.infinity,
                90,
                secondaryColor,
                primaryColor,
                'Plan Day',
                bigButtonFontSize,
                true,
                go: SetDayWorkPage(_getFutureTaskAllDataFromDB),
                HowToGO: 'push',
              ),
              _allTask.length == 0
                  ? Center(
                      child: Text(
                        'Add any thing for the future',
                        style: TextStyle(color: primaryColor),
                      ),
                    )
                  : Container(
                    height: 600,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics().applyTo(BouncingScrollPhysics()),
                        itemCount: _allTask.length,
                        
                        itemBuilder: (BuildContext context, int index) {
                          final _dats = _allTask[index];
                          print(_dats);
                          return futureTaskListview(_dats.day, _dats.month, _dats.year, _dats.hr, _dats.min, _dats.content,index,_getFutureTaskAllDataFromDB);
                        }),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
