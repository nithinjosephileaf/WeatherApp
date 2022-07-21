import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:weather_app/app/custom_widgets/cloud_page.dart';
import 'package:weather_app/app/data/weather.dart';
import 'package:weather_app/app/modules/search/views/search_view.dart';
import 'package:weather_app/app/values/colors.dart';

final currentPageNotifier = ValueNotifier<int>(0);

List<WeatherTable> weatherList() {
  final weather = Hive.box<WeatherTable>("weather_box");
  return weather.values.toList();
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchView()),
                  )
                },
                child: Container(
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
                      children: const [
                        Text(
                          "Search Location",
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                        Icon(
                          Icons.search,
                          color: AppColors.greyColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildCircleIndicator(),
              Expanded(
                  child: PageView.builder(
                      onPageChanged: (int index) {
                        currentPageNotifier.value = index;
                      },
                      itemCount: weatherList().length,
                      itemBuilder: (BuildContext context, int pageIndex) {
                        return CloudPageView(weatherList()[pageIndex]);
                      }))
            ],
          )),
    );
  }

  _buildCircleIndicator() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: weatherList().length,
          currentPageNotifier: currentPageNotifier,
        ));
  }
}
