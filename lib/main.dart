import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/app/config/initial_binding.dart';
import 'package:weather_app/app/data/weather.dart';
import 'package:weather_app/app/services/local_storage/local_database_init.dart';
import 'package:weather_app/app/values/constants.dart';

import 'app/routes/app_pages.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

void main() async{

  await initLocalDb();
  await Hive.openBox<WeatherTable>('weather_box');


  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [AppConstants.shared.routeObserver],
      builder: EasyLoading.init(),
    ),
  );
}
