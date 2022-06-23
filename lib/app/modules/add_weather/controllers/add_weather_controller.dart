import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/app/data/weather.dart';

import '../../home/controllers/home_controller.dart';

class AddWeatherController extends GetxController {
  //TODO: Implement AddWeatherController

  dynamic argumentdata = Get.arguments;
  final count = 0.obs;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController degreecelsious = TextEditingController();
  late WeatherTable table;
  final controller=Get.find<HomeController>();

  final _weatherbox = Hive.box<WeatherTable>("weather_box");

  @override
  void onInit() {
    super.onInit();
    table = Get.arguments[0];
    namecontroller.text = table.location_name;
    degreecelsious.text = table.degree_celsious.toString();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void saveLocation() async {
   await _weatherbox.add(table);
    controller.getWeatherList();

  }
}
