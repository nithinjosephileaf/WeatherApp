import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/config/bloc/weather_bloc.dart';
import 'package:weather_app/app/modules/search/views/search_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
            create: (context) => WeatherCubit(), child: WeatherWidget()));
  }
}
