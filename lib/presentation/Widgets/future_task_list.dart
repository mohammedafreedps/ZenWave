import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';

class FutureTaskListView extends StatefulWidget {
  final int day;
  final int dmonth;
  final int dyear;
  final int dmin;
  final int dhr;
  final String dcontent;
  final int index;
  final int priority;


  FutureTaskListView(
      this.day, this.dmonth, this.dyear, this.dmin, this.dhr, this.dcontent,this.index,this.priority);

  @override
  State<FutureTaskListView> createState() => FutureTaskListViewState();
}

class FutureTaskListViewState extends State<FutureTaskListView> {
  Color? _priorityColor; 
  _setColor(){
    if (widget.priority == 1) {
      _priorityColor = Colors.red;
    }
    if (widget.priority == 2) {
      _priorityColor = Colors.amber;
    }
    if (widget.priority == 3) {
      _priorityColor = Colors.green;
    }
  }
  @override
  void initState() {
    _setColor();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    _setColor();
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
          child: Container(
            color: SECONDARY_COLOR,
            width: 450,
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Date: '+ widget.day.toString() + ' - ' + widget.dmonth.toString() + ' - ' + widget.dyear.toString()),
                Text('Time: ' + widget.dmin.toString() + ' - ' + widget.dhr.toString()),
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    width: 10,
                    height: 10,
                    color: _priorityColor,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 40,)
      ],
    );
  }
}
