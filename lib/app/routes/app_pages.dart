import 'package:get/get.dart';

import '../modules/add_weather/bindings/add_weather_binding.dart';
import '../modules/add_weather/views/add_weather_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.ADD_WEATHER,
      page: () => AddWeatherView(),
      binding: AddWeatherBinding(),
    ),
  ];
}
