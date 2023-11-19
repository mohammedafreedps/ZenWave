// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capture_moments.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class captureMomentsAdapter extends TypeAdapter<captureMoments> {
  @override
  final int typeId = 6;

  @override
  captureMoments read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return captureMoments(
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
  void write(BinaryWriter writer, captureMoments obj) {
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
      ..write(obj.imgPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is captureMomentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
