import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/app/data/weather.dart';

import '../../../values/app_assets_source.dart';
import '../../../values/colors.dart';

class AddWeatherView extends StatelessWidget {
  final WeatherTable weatherTable;

  AddWeatherView(this.weatherTable);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                // GestureDetector(
                //     onTap: Get.back, child: const Icon(Icons.arrow_back_ios)),
                const Spacer(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // controller.saveLocation();
                      saveLocation(weatherTable);
                    },
                    label: const Text(
                      "Add to list",
                      style: TextStyle(color: AppColors.black),
                    ),
                    icon: const Icon(Icons.add_circle_rounded,
                        color: AppColors.black),
                    style: ElevatedButton.styleFrom(primary: Colors.white70),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(AppAssetSource.cloud_all),
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              weatherTable.location_name,
                              style: const TextStyle(
                                  color: Color.fromRGBO(44, 44, 44, 1),
                                  fontSize: 30,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  height: 1),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Image.asset(AppAssetSource.arrow)
                          ]),
                      Text(
                        "${weatherTable.degree_celsious.toString()} \u2103",
                        style: const TextStyle(
                            fontSize: 30, fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(11),
                            topRight: Radius.circular(11),
                            bottomLeft: Radius.circular(11),
                            bottomRight: Radius.circular(11)),
                        color: AppColors.greyWhite),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "TIME",
                                style: TextStyle(color: AppColors.greyColor),
                              ),
                              Text(
                                "11:25 AM",
                                style: TextStyle(color: AppColors.greyColor),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text("uv",
                                  style: TextStyle(color: AppColors.greyColor)),
                              Text("4",
                                  style: TextStyle(color: AppColors.greyColor))
                            ],
                          ),
                          Column(
                            children: const [
                              Text("% RAIN",
                                  style: TextStyle(color: AppColors.greyColor)),
                              Text("58%",
                                  style: TextStyle(color: AppColors.greyColor))
                            ],
                          ),
                          Column(
                            children: const [
                              Text("AQ",
                                  style: TextStyle(color: AppColors.greyColor)),
                              Text("22",
                                  style: TextStyle(color: AppColors.greyColor))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

void saveLocation(WeatherTable table) async {
  final _weatherbox = Hive.box<WeatherTable>("weather_box");
  await _weatherbox.add(table);
}
