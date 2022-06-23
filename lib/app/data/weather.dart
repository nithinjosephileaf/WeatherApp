import 'package:hive_flutter/hive_flutter.dart';

part 'weather.g.dart';
@HiveType(typeId: 1)
class WeatherTable {
  @HiveField(0)
  String location_name;
  @HiveField(1)
  double degree_celsious;

  WeatherTable(this.location_name, this.degree_celsious);
}
