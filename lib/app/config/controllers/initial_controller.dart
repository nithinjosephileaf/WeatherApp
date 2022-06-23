import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/app/data/weather.dart';

class InitialController extends GetxController {
  //TODO: Implement InitialController

  final count = 0.obs;
  final _weatherbox= Hive.box<WeatherTable>("weather_box");

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;



}
