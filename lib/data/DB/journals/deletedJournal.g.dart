// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deletedJournal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class deletedJournalAdapter extends TypeAdapter<deletedJournal> {
  @override
  final int typeId = 3;

  @override
  deletedJournal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return deletedJournal(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      fields[5] as bool,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, deletedJournal obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.month)
      ..writeByte(4)
      ..write(obj.year)
      ..writeByte(5)
      ..write(obj.edited)
      ..writeByte(6)
      ..write(obj.fromWhere);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is deletedJournalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
