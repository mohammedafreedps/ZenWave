import 'package:hive/hive.dart';

part 'capture_moments.g.dart';

@HiveType(typeId: 6)
class captureMoments {
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
  String imgPath;

  captureMoments(this.title,this.content, this.day, this.month, this.year,this.edited,this.imgPath);
}
