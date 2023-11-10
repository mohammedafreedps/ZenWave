import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/DB/Boxes.dart';
import 'package:zenwave/Pages/EntryviewPage.dart';

class futureTaskListview extends StatefulWidget {
  int day;
  int dmonth;
  int dyear;
  int dmin;
  int dhr;
  String dcontent;
  int index;
  Function dtoPerform;

  futureTaskListview(
      this.day, this.dmonth, this.dyear, this.dmin, this.dhr, this.dcontent,this.index,this.dtoPerform);

  @override
  State<futureTaskListview> createState() => futureTaskListviewState();
}

class futureTaskListviewState extends State<futureTaskListview> {
  @override
  Widget build(BuildContext context) {
    _deleteFutrueTask(index)async{
      futureTaskBox.deleteAt(index);
      widget.dtoPerform();
    }
    return Column(
      children: [
        InkWell(
          onLongPress: (){
            _deleteFutrueTask(widget.index);
          },
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EntryviewPage(widget.dcontent, false)));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(clipBorderRadious),
            child: Container(
              color: secondaryColor,
              width: 450,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Date: '+ widget.day.toString() + ' - ' + widget.dmonth.toString() + ' - ' + widget.dyear.toString()),
                  Text('Time: ' + widget.dmin.toString() + ' - ' + widget.dhr.toString())
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 40,)
      ],
    );
  }
}
