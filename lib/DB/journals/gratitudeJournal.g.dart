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
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, gratutudeJournal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.year);
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
