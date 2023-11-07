import 'package:hive/hive.dart';

part 'moodtracker.g.dart';

@HiveType(typeId: 1)
class moodtracker extends HiveObject{
  @HiveField(0)
  int mood;
  @HiveField(1)
  String date;
  moodtracker(this.mood,this.date);
}