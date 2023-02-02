import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/app/data/weather_response.dart';
import 'package:weather_app/app/services/network/endpoints.dart';
import 'package:weather_app/app/services/network/exceptions.dart';
import 'package:weather_app/app/services/network/http_client.dart';

import '../../../../main.dart';
import '../../../data/weather.dart';

class SearchController extends GetxController with RouteAware {
  //TODO: Implement SearchController

  final count = 0.obs;

  TextEditingController searchviewcontroller = TextEditingController();

  final _weatherbox = Hive.box<WeatherTable>("weather_box");
  List<WeatherTable> weather_list = <WeatherTable>[].obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, GetPageRoute());
    });
    super.onInit();
  }

  @override
  void didPush() {
    print('SearchPage: Called didPush');
    super.didPush();
  }

  @override
  void didPop() {
    print('SearchPage: Called didPop');
    super.didPop();
  }

  @override
  void didPopNext() {
    print('SearchPage: Called didPopNext');
    super.didPopNext();
  }

  @override
  void didPushNext() {
    print('SearchPage: Called didPushNext');
    super.didPushNext();
  }

  @override
  void onReady() {
    super.onReady();
    print("on ready");
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  List<WeatherTable> getAllData() {
    List<WeatherTable> list = _weatherbox.values.toList();
    print(list.length);

    return list;
  }

  // void insertAllWeatherData() {
  //   weather_list.add(WeatherTable("Kerala",27));
  //   weather_list.add(WeatherTable("Hyderabad",31));
  //   weather_list.add(WeatherTable("Ooty",15));
  //   weather_list.add(WeatherTable("Mumbai",20));
  //   weather_list.add(WeatherTable("Pune",25));
  // }

  void getWeatherData() async {
    EasyLoading.show();
    weather_list.clear();
    final httpclient = Get.find<HttpClient>();
    try {
      final response = await httpclient.request(EndPoint.getWeather,
          queryParameters: {
            "q": searchviewcontroller.text,
            "APPID": "e94a847d02990cf4d427631ea8014314"
          });
      final data = WeatherResponse.fromJson(response.data);

      weather_list
          .add(WeatherTable(data.name.toString(), data.wind!.deg!.toDouble()));
      EasyLoading.dismiss();
    } on AppException catch (e) {
      EasyLoading.dismiss();
      return null;
    }
  }
}
