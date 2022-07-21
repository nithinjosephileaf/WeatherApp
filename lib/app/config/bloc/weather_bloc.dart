import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/config/movie_state.dart';
import 'package:weather_app/app/data/weather.dart';
import 'package:weather_app/app/services/network/http_client.dart';

import '../../data/weather_response.dart';
import '../../services/network/network.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitialState()) {}

  Future<void> getWeather(String city) async {
    emit(LoadingState());
    List<WeatherTable> weather_list = [];
    var httpclient = HttpClientImpl(Dio());
    try {
      final response = await httpclient.request(EndPoint.getWeather,
          queryParameters: {
            "q": city,
            "APPID": "e94a847d02990cf4d427631ea8014314"
          });
      final data = WeatherResponse.fromJson(response.data);
      weather_list
          .add(WeatherTable(data.name.toString(), data.wind!.deg!.toDouble()));
      emit(LoadedState(weather_list));
    } on AppException catch (e) {
      emit(ErrorState());
    }
  }
}
