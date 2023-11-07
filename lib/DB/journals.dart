import 'package:hive/hive.dart';

part 'journals.g.dart';

@HiveType(typeId: 2)
class PersonalJournals extends HiveObject{
  @HiveField(0)
  String contents;
  @HiveField(1)
  String date;
  PersonalJournals(this.contents,this.date);
}


@HiveType(typeId: 3)
class GratitudeJournals extends HiveObject{
  @HiveField(0)
  String contents;
  @HiveField(1)
  String date;
  GratitudeJournals(this.contents,this.date);
}


@HiveType(typeId: 4)
class DeletedJournals extends HiveObject{
  @HiveField(0)
  String contents;
  @HiveField(1)
  String date;
  DeletedJournals(this.contents,this.date);
}