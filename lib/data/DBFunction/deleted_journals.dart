import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/journals/deletedJournal.dart';

List allValueInDeletedJournalDB = [];


getallValueFromDeletedJournal(){
  allValueInDeletedJournalDB = deletedJournalBox.values.toList();
  return allValueInDeletedJournalDB;
}

addValueToDeletedJournal(String title, String content, int day, int month, int year, bool edited,String fromWhere)async{
  await deletedJournalBox.put(DateTime.now().toString(), deletedJournal(title, content, day, month, year, edited, fromWhere));
}

deleteValueInDeletedJournal(int index)async{
  await deletedJournalBox.deleteAt(index);
}