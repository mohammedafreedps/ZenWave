import 'package:hive/hive.dart';

deleteAllValueInJournalEtherate(List journals, Box box) {
  if (journals.isNotEmpty) {
    for (var i = 0; i < journals.length; i++) {
      box.deleteAt(i);
    }
  }
}
