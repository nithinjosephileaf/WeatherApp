// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherTableAdapter extends TypeAdapter<WeatherTable> {
  @override
  final int typeId = 1;

  @override
  WeatherTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherTable(
      fields[0] as String,
      fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherTable obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.location_name)
      ..writeByte(1)
      ..write(obj.degree_celsious);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
