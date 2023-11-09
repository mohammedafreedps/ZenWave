import 'package:hive/hive.dart';

part 'gratitudeJournal.g.dart';

@HiveType(typeId: 2)
class gratutudeJournal{
  @HiveField(0)
  String content;

  @HiveField(1)
  int day;

    @HiveField(2)
  int month;

    @HiveField(3)
  int year;

  gratutudeJournal(this.content,this.day,this.month,this.year);
}
