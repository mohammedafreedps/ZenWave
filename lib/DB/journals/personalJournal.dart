import 'package:hive/hive.dart';

part 'personalJournal.g.dart';

@HiveType(typeId: 1)
class personalJournal{
  @HiveField(0)
  String content;

  @HiveField(1)
  int day;

    @HiveField(2)
  int month;

    @HiveField(3)
  int year;

  personalJournal(this.content,this.day,this.month,this.year);
}
