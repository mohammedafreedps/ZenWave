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
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, deletedJournal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
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
