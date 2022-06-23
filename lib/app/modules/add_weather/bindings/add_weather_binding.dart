import 'package:get/get.dart';

import '../controllers/add_weather_controller.dart';

class AddWeatherBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AddWeatherController>(
    //   () => AddWeatherController(),
    // );
    Get.put(AddWeatherController());
  }
}
