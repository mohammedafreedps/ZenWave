// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'futureTask.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class futureTaskAdapter extends TypeAdapter<futureTask> {
  @override
  final int typeId = 5;

  @override
  futureTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return futureTask(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, futureTask obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.month)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.min)
      ..writeByte(4)
      ..write(obj.hr)
      ..writeByte(5)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is futureTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
