import 'package:get/get.dart';
import 'package:weather_app/app/config/controllers/initial_controller.dart';

import '../services/network/http_client.dart';
import '../services/network/network.dart';
import 'easy_loading_config.dart';
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    configEasyLoading();
    // Get.lazyPut<LocalStorage>(() => LocalStorageImpl());
    // Get.put<EmployeeStore>(EmployeeStore(Get.find<LocalStorage>()),
    //     permanent: true);
    Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);
    Get.put<InitialController>( InitialController());
    
  }
}
