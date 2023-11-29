import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/data/DBFunction/future_Tasks.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Pages/future_task_edit_page.dart';
import 'package:zenwave/presentation/Pages/future_task_view_page.dart';
import 'package:zenwave/presentation/Pages/set_day_work_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/future_task_list.dart';

class FutureWorkPlanPage extends StatefulWidget {
  const FutureWorkPlanPage({super.key});

  @override
  State<FutureWorkPlanPage> createState() => _FutureWorkPlanPageState();
}

class _FutureWorkPlanPageState extends State<FutureWorkPlanPage> {
  DateTime? _selectedDate;
  List _searchResuls = [];
  @override
  void initState() {
    allValueInFutureTaskDB = getAllValueFromFutureTask();
    _searchResuls = allValueInFutureTaskDB;
    super.initState();
  }

  _refresh() {
    if (mounted) {
      setState(() {
        allValueInFutureTaskDB = getAllValueFromFutureTask();
        Navigator.pop(context);
      });
    }
  }

 _searchByPriority(int priority) {
  setState(() {
    _searchResuls = allValueInFutureTaskDB.where((prio) {
      return prio.priority == priority;
    }).toList();
  });
}


  _showPriorityLsit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Set priority'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _searchByPriority(3);
                  },
                  child: Text('Low')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _searchByPriority(2);
                  },
                  child: Text('Medium')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _searchByPriority(1);
                  },
                  child: Text('High')),
            ],
          );
        });
  }

  _searchByDate(DateTime searchDate) {
    int _searchDay = searchDate.day;
    int _searchMonth = searchDate.month;
    int _searchYear = searchDate.year;
    _searchResuls = allValueInFutureTaskDB.where((journal) {
      return journal.day == _searchDay &&
          journal.month == _searchMonth &&
          journal.year == _searchYear;
    }).toList();
  }

  _showCalender() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2040))
        .then((value) {
      setState(() {
        _selectedDate = value;
        if (_selectedDate != null) {
          _searchByDate(_selectedDate!);
        }
      });
    });
  }

  _editValues(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return FutureTaskEditPage(_refresh, index);
    }));
  }

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
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(PAGE_PADDING),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Search by',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _searchResuls = allValueInFutureTaskDB;
                          });
                        },
                        icon: Icon(Icons.refresh))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomisableButton(
                      PLANWORK_BUTTON_WIDTH!,
                      PLANWORK_BUTTON_HEIGHT!,
                      SECONDARY_COLOR,
                      PRIMARY_COLOR,
                      'Date',
                      SETDAY_BUTTON_FONTSIZE!,
                      true,
                      toPerform: _showCalender,
                    ),
                    CustomisableButton(
                      PLANWORK_BUTTON_WIDTH!,
                      PLANWORK_BUTTON_HEIGHT!,
                      SECONDARY_COLOR,
                      PRIMARY_COLOR,
                      'Priority',
                      SETDAY_BUTTON_FONTSIZE!,
                      true,
                      toPerform: _showPriorityLsit,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: SCREEN_HEIGHT - 350,
                  child: ListView.builder(
                      itemCount: _searchResuls.length,
                      itemBuilder: (BuildContext context, int index) {
                        final _giver = _searchResuls[index];
                        final _tasks = _searchResuls[index];
                        final _originlIndx = allValueInFutureTaskDB.indexOf(_tasks);
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return FutureTaskViewPage(task: _giver.content,day: _giver.day,month: _giver.month, year: _giver.year,hour: _giver.hr,minutes: _giver.min,);
                            }));
                          },
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Do you want to'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _editValues(_originlIndx);
                                          },
                                          child: Text('Edit')),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              deleteValueInFutureTask(_originlIndx);
                                              allValueInFutureTaskDB =
                                                  getAllValueFromFutureTask();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text('Delete')),
                                    ],
                                  );
                                });
                          },
                          child: FutureTaskListView(
                              _giver.day,
                              _giver.month,
                              _giver.year,
                              _giver.min,
                              _giver.hr,
                              _giver.content,
                              _originlIndx,
                              _giver.priority),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: Elevetion,
        backgroundColor: SECONDARY_COLOR,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return SetDayWorkPage(_refresh);
            }),
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }
}
