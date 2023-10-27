import 'package:hive/hive.dart';

part 'journals.g.dart';

@HiveType(typeId: 2)
class PersonalJournals {
  @HiveField(0)
  String Contents;
  @HiveField(1)
  String Date;
  PersonalJournals(this.Contents,this.Date);
}


@HiveType(typeId: 3)
class GratitudeJournals {
  @HiveField(0)
  String Contents;
  @HiveField(1)
  String Date;
  GratitudeJournals(this.Contents,this.Date);
}


@HiveType(typeId: 4)
class DeletedJournals {
  @HiveField(0)
  String Contents;
  @HiveField(1)
  String Date;
  DeletedJournals(this.Contents,this.Date);
}