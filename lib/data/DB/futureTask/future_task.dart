import 'package:hive/hive.dart';

part 'future_task.g.dart';

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

  @HiveField(6)
  int priority;

  futureTask(this.day, this.month,this.year,this.min,this.hr,this.content,this.priority);
}
