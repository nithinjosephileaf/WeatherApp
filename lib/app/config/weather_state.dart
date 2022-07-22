import 'package:equatable/equatable.dart';

import '../data/weather.dart';

abstract class WeatherState extends Equatable {}

class InitialState extends WeatherState {
  @override
  List<Object> get props => [];
}

class LoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class LoadedState extends WeatherState {
  List<WeatherTable> weatherlist = [];
  LoadedState(this.weatherlist);

  @override
  List<Object> get props => [weatherlist];
}

class ErrorState extends WeatherState {
  @override
  List<Object?> get props => [];
}
