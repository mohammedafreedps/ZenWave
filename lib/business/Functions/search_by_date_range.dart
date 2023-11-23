import 'package:hive/hive.dart';

searchBydateRange(Box box, DateTime starting, DateTime ending){
  List updatedResults = [];
   for (var i = 0; i < box.length; i++) {
      final entry = box.getAt(i);
      DateTime entryDate = DateTime(entry.year, entry.month, entry.day);

      if (entryDate.isAfter(starting.subtract(Duration(days: 1))) &&
          entryDate.isBefore(ending.add(Duration(days: 1)))) {
        updatedResults.add(entry);
      }
    }
  return List.from(updatedResults);
}