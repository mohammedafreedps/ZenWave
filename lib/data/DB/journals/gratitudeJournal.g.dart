// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gratitudeJournal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class gratutudeJournalAdapter extends TypeAdapter<gratutudeJournal> {
  @override
  final int typeId = 2;

  @override
  gratutudeJournal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return gratutudeJournal(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, gratutudeJournal obj) {
    writer
      ..writeByte(6)
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
      ..write(obj.edited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is gratutudeJournalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
