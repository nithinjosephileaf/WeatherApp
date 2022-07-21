import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/app/data/weather.dart';
import 'package:weather_app/app/services/local_storage/local_database_init.dart';

import 'app/config/easy_loading_config.dart';
import 'app/modules/home/views/home_view.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

void main() async {
  await initLocalDb();
  await Hive.openBox<WeatherTable>('weather_box');
  configEasyLoading();
  runApp(MyApp());

  // runApp(
  //   GetMaterialApp(
  //     title: "Application",
  //     initialRoute: AppPages.INITIAL,
  //     initialBinding: InitialBinding(),
  //     getPages: AppPages.routes,
  //     debugShowCheckedModeBanner: false,
  //     navigatorObservers: [AppConstants.shared.routeObserver],
  //     builder: EasyLoading.init(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: HomeView(),
    );
  }
}
