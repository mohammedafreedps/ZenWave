// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moodTracking.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class moodTrackingAdapter extends TypeAdapter<moodTracking> {
  @override
  final int typeId = 4;

  @override
  moodTracking read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return moodTracking(
      fields[0] as DateTime,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, moodTracking obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.mood);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is moodTrackingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
