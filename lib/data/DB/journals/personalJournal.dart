import 'package:hive/hive.dart';

part 'personalJournal.g.dart';

@HiveType(typeId: 1)
class personalJournal {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  int day;

  @HiveField(3)
  int month;

  @HiveField(4)
  int year;

  @HiveField(5)
  bool edited;

  personalJournal(this.title,this.content, this.day, this.month, this.year,this.edited);
}
