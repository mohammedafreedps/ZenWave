import 'package:hive/hive.dart';

part 'futureTask.g.dart';

@HiveType(typeId: 5)
class futureTask {
  @HiveField(0)
  int day;

  @HiveField(1)
  int month;

  @HiveField(2)
  int year;

  @HiveField(3)
  int min;

  @HiveField(4)
  int hr;

  @HiveField(5)
  String content;

  futureTask(this.day, this.month,this.year,this.min,this.hr,this.content);
}
