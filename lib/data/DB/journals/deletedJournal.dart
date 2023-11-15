import 'package:hive/hive.dart';

part 'deletedJournal.g.dart';

@HiveType(typeId: 3)
class deletedJournal {
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

  @HiveField(6)
  String fromWhere;

  deletedJournal(this.title,this.content,this.day,this.month,this.year,this.edited,this.fromWhere);
}
