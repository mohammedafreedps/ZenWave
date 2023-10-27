import 'package:hive/hive.dart';

part 'moodtracker.g.dart';

@HiveType(typeId: 1)
class moodtracker {
  @HiveField(0)
  int Mood;
  @HiveField(1)
  String Date;
  moodtracker(this.Mood,this.Date);
}