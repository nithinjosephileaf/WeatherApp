import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/app/data/weather.dart';

import '../../../../main.dart';
import '../../../values/constants.dart';

class HomeController extends GetxController with RouteAware {
  //TODO: Implement HomeController

  final count = 0.obs;
  final currentPageNotifier = ValueNotifier<int>(0);
  final _weatherbox= Hive.box<WeatherTable>("weather_box");
  final list=<WeatherTable>[].obs;


  @override
  void onInit() {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this,GetPageRoute());
    });
    list.value=_weatherbox.values.toList();
    print(list.length);
    super.onInit();
  }

  @override
  void onReady() {
    getWeatherList();
    super.onReady();
    print("onready");
  }
  @override
  void didPush() {
    print('HomePage: Called didPush');
    super.didPush();
  }

  @override
  void didPop() {
    print('HomePage: Called didPop');
    super.didPop();
  }

  @override
  void didPopNext() {
    print('HomePage: Called didPopNext');
    super.didPopNext();
  }

  @override
  void didPushNext() {
    print('HomePage: Called didPushNext');
    super.didPushNext();
  }

 void getWeatherList(){
    print("weatherlist called");
    list.value=_weatherbox.values.toList();

  }


  @override
  void onClose() {}
  void increment() => count.value++;
}
