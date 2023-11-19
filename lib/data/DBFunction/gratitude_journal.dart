import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/journals/gratitudeJournal.dart';

List allValueInGratitudeJournalsDB = [];
gratutudeJournal? gratutudeJournalEdit;

getAllValueFromGratutudeJournal() {
  allValueInGratitudeJournalsDB = gratitudeJournalBox.values.toList();
  return allValueInGratitudeJournalsDB;
}

addValueToGratutudeJournal(String title, String content, int day, int month,
    int year, bool edited) async {
  await gratitudeJournalBox.put(DateTime.now().toString(),
      gratutudeJournal(title, content, day, month, year, edited));
}

deleteValueInGratutudeJournal(int index) async {
  await gratitudeJournalBox.deleteAt(index);
}

editValuesInGratutudeJournal(int index, String title, String content, int day,
    int month, int year, bool edited) {
  gratutudeJournalEdit = gratitudeJournalBox.getAt(index);
  gratutudeJournalEdit!.title = title;
  gratutudeJournalEdit!.content = content;
  gratutudeJournalEdit!.day = day;
  gratutudeJournalEdit!.month = month;
  gratutudeJournalEdit!.year = year;
  gratutudeJournalEdit!.edited = edited;
  gratitudeJournalBox.putAt(index, gratutudeJournalEdit);
}
