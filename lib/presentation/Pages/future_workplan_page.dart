import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/presentation/Pages/set_day_work_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/future_task_list.dart';

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
        backgroundColor: BASE_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.all(PAGE_PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomisableButton(
                double.infinity,
                90,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                'Plan Day',
                BIG_BUTTON_FONT_SIZE,
                true,
                go: SetDayWorkPage(_getFutureTaskAllDataFromDB),
                HowToGO: 'push',
              ),
              _allTask.length == 0
                  ? Center(
                      child: Text(
                        'Add any thing for the future',
                        style: TextStyle(color: PRIMARY_COLOR),
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
                          return FutureTaskListView(_dats.day, _dats.month, _dats.year, _dats.hr, _dats.min, _dats.content,index,_getFutureTaskAllDataFromDB);
                        }),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
