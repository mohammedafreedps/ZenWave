import 'package:hive/hive.dart';

part 'deletedJournal.g.dart';

@HiveType(typeId: 3)
class deletedJournal {
  @HiveField(0)
  String content;

  @HiveField(1)
  int day;

  @HiveField(2)
  int month;

  @HiveField(3)
  int year;

  @HiveField(4)
  String fromWhere;

  deletedJournal(this.content, this.day, this.month, this.year,this.fromWhere);
}
