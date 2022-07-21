import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weather_app/app/config/bloc/weather_bloc.dart';
import 'package:weather_app/app/modules/add_weather/views/add_weather_view.dart';
import 'package:weather_app/app/modules/search/views/weather_view.dart';

import '../../../config/movie_state.dart';
import '../../../values/colors.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search_controller = TextEditingController();
    final weatherBloc = BlocProvider.of<WeatherCubit>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            height: 46,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: AppColors.greyWhite,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: search_controller,
                      autofocus: true,
                      decoration: const InputDecoration(
                          hintText: "Search location",
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      weatherBloc.getWeather(search_controller.text);
                      // controller.getWeatherData()
                    },
                    child: const Icon(
                      Icons.search,
                      color: AppColors.greyColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is LoadingState) {
                EasyLoading.show();
                return Text("");
              } else if (state is ErrorState) {
                EasyLoading.dismiss();
                return Container();
              } else if (state is LoadedState) {
                EasyLoading.dismiss();
                final weather = state.weatherlist;
                return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: weather.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddWeatherView(weather[index])));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: AppColors.greyWhite,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      weather[index].location_name,
                                      style: const TextStyle(
                                          color: Color.fromRGBO(44, 44, 44, 1),
                                          fontSize: 15,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          height: 1),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${weather[index].degree_celsious} \u2103",
                                      style: const TextStyle(
                                          fontSize: 30, fontFamily: "Poppins"),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 90,
                                  height: 90,
                                  child: checkConditions(100),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return Container();
            },
          ))
        ],
      ),
    );
  }
}
