import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/journals/personalJournal.dart';

List allValueInPersonalJournalsDB = [];
personalJournal? personalJournalEdit;

getAllValueFromPersonalJournal() {
  allValueInPersonalJournalsDB = personalJournalBox.values.toList();
  return allValueInPersonalJournalsDB;
}

addValueToPersonalJournal(String title, String content, int day, int month,
    int year, bool edited) async {
  await personalJournalBox.put(DateTime.now().toString(),
      personalJournal(title, content, day, month, year, edited));
}

deleteValueInPersonalJournal(int index) async {
  await personalJournalBox.deleteAt(index);
}

editValuesInPersonalJournal(int index, String title, String content, int day,
    int month, int year, bool edited) {
  personalJournalEdit = personalJournalBox.getAt(index);
  personalJournalEdit!.title = title;
  personalJournalEdit!.content = content;
  personalJournalEdit!.day = day;
  personalJournalEdit!.month = month;
  personalJournalEdit!.year = year;
  personalJournalEdit!.edited = edited;
  personalJournalBox.putAt(index, personalJournalEdit);
}
