import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/presentation/Pages/entry_view_page.dart';

class FutureTaskListView extends StatefulWidget {
  final int day;
  final int dmonth;
  final int dyear;
  final int dmin;
  final int dhr;
  final String dcontent;
  final int index;
  final Function dtoPerform;

  FutureTaskListView(
      this.day, this.dmonth, this.dyear, this.dmin, this.dhr, this.dcontent,this.index,this.dtoPerform);

  @override
  State<FutureTaskListView> createState() => FutureTaskListViewState();
}

class FutureTaskListViewState extends State<FutureTaskListView> {
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
            borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
            child: Container(
              color: SECONDARY_COLOR,
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
