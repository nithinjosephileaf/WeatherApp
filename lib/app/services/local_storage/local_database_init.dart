import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/app/data/weather.dart'; // Project imports:


Future<void> initLocalDb() async {
  await Hive.initFlutter();

  // Hive..registerAdapter(WeatherTableAdapter())..registerAdapter(adapter);
  Hive.registerAdapter(WeatherTableAdapter());

  await registerBoxes();
}

registerBoxes() async {
  //Open Boxes
  // final Box<LoginResponse> authBox = await Hive.openBox<LoginResponse>(HiveBoxStrings.authBox);
  // final Box<Config> configBox = await Hive.openBox<Config>(HiveBoxStrings.configBox);



  //Register Boxes
  // Get.put<Box<LoginResponse>>(authBox, tag: HiveBoxStrings.authBox);
  // Get.put<Box<Config>>(configBox, tag: HiveBoxStrings.configBox);

  // Get.put(AuthBaseController());

  // await Hive.openBox<WeatherTable>('weather_box');
}
