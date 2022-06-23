import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/modules/search/views/weather_view.dart';

import '../../../values/app_assets_source.dart';
import '../../../values/colors.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: Get.width,
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
                  children:  [
                    Expanded(
                      child: TextField(
                        controller: controller.searchviewcontroller,
                        autofocus: true,
                        decoration: const InputDecoration(
                            hintText: "Search location",
                            border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>{
                        controller.getWeatherData()
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
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: controller.weather_list.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () => Get.toNamed("/add-weather",
                              arguments: [controller.weather_list[index]]),
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
                                      controller.weather_list[index]
                                          .location_name
                                          .toString(),
                                      style: const TextStyle(
                                          color: Color.fromRGBO(44, 44, 44, 1),
                                          fontSize: 15,
                                          letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          height: 1),
                                    ),
                                    const SizedBox(height: 10,),
                                    Text(
                                      "${controller.weather_list[index]
                                          .degree_celsious.toString()}  \u2103",
                                      style: const TextStyle(
                                          fontSize: 30, fontFamily: "Poppins"),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 90,
                                  height: 90,
                                  child: checkConditions(
                                      controller.weather_list[index]
                                          .degree_celsious),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
