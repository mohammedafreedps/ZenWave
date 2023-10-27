// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journals.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalJournalsAdapter extends TypeAdapter<PersonalJournals> {
  @override
  final int typeId = 2;

  @override
  PersonalJournals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalJournals(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalJournals obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.Contents)
      ..writeByte(1)
      ..write(obj.Date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalJournalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GratitudeJournalsAdapter extends TypeAdapter<GratitudeJournals> {
  @override
  final int typeId = 3;

  @override
  GratitudeJournals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GratitudeJournals(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GratitudeJournals obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.Contents)
      ..writeByte(1)
      ..write(obj.Date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GratitudeJournalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeletedJournalsAdapter extends TypeAdapter<DeletedJournals> {
  @override
  final int typeId = 4;

  @override
  DeletedJournals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeletedJournals(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeletedJournals obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.Contents)
      ..writeByte(1)
      ..write(obj.Date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeletedJournalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
