import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/captureMoments/captureMoments.dart';

List allValueInCaptureMomentsInDB = [];
captureMoments? captureMomentsEdit; 

List getAllValueFromCaptureMomentsDB(){
  allValueInCaptureMomentsInDB =  captureMomentsBox.values.toList();
  return allValueInCaptureMomentsInDB;
}

addValueToCaptureMomentsDB(String title,String content, int day,int month,int year, bool edited, String imgPath)async{
  await captureMomentsBox.put(DateTime.now().toString(), captureMoments(title, content, day, month, year, edited, imgPath));
}

deleValueInCaptureMomentsDB(int index)async{
  await captureMomentsBox.deleteAt(index);
}

editValuesInCaptureMomentsDB(int index,String title,String content, int day,int month,int year, bool edited, String imgPath)async{
  captureMomentsEdit = captureMomentsBox.getAt(index);
  captureMomentsEdit!.title = title;
  captureMomentsEdit!.content = content;
  captureMomentsEdit!.day = day;
  captureMomentsEdit!.month = month;
  captureMomentsEdit!.year = year;
  captureMomentsEdit!.edited = edited;
  captureMomentsEdit!.imgPath = imgPath;
  captureMomentsBox.putAt(index, captureMomentsEdit);
}