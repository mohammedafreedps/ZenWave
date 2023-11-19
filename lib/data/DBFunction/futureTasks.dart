import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/futureTask/futureTask.dart';

List allValueInFutureTaskDB = [];
futureTask? futureTaskEdit;


List getAllValueFromFutureTask(){
  allValueInFutureTaskDB = futureTaskBox.values.toList();
  return allValueInFutureTaskDB;
}

addValueToFutureTask(int day , int month, int year , int min , int hr ,String content ,int priority) async{ 
  await futureTaskBox.put(DateTime.now().toString(), futureTask(day, month, year, min, hr, content, priority));
}

deleteValueInFutureTask(int index)async{
  await futureTaskBox.deleteAt(index);
}

editValuesInFutureTask(index,int day , int month, int year , int min , int hr ,String content ,int priority){
  futureTaskEdit = futureTaskBox.getAt(index);
  futureTaskEdit!.day = day;
  futureTaskEdit!.month = month;
  futureTaskEdit!.year = year;
  futureTaskEdit!.min = min;
  futureTaskEdit!.hr = hr;
  futureTaskEdit!.content = content;
  futureTaskEdit!.priority = priority;
  futureTaskBox.putAt(index, futureTaskEdit);
}