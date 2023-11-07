// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moodtracker.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class moodtrackerAdapter extends TypeAdapter<moodtracker> {
  @override
  final int typeId = 1;

  @override
  moodtracker read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return moodtracker(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, moodtracker obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.mood)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is moodtrackerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
