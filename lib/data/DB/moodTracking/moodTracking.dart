import 'package:hive/hive.dart';

part 'moodTracking.g.dart';

@HiveType(typeId: 4)
class moodTracking extends HiveObject{
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int mood;

  moodTracking(this.date,this.mood);
}


