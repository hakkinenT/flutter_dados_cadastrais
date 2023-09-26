// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegisterDataAdapter extends TypeAdapter<RegisterData> {
  @override
  final int typeId = 0;

  @override
  RegisterData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegisterData(
      name: fields[0] as String,
      birthDate: fields[1] as DateTime,
      experienceLevel: (fields[2] as List).cast<String>(),
      preferredLanguage: (fields[3] as List).cast<String>(),
      experienceTime: fields[4] as int,
      salary: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, RegisterData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthDate)
      ..writeByte(2)
      ..write(obj.experienceLevel)
      ..writeByte(3)
      ..write(obj.preferredLanguage)
      ..writeByte(4)
      ..write(obj.experienceTime)
      ..writeByte(5)
      ..write(obj.salary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
