import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:weather_app/app/custom_widgets/cloud_page.dart';
import 'package:weather_app/app/modules/search/views/search_view.dart';
import 'package:weather_app/app/values/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    print("view recreated");
    return
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => {Get.toNamed("/search")},
                child: Container(
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
                // child: PageView(
                //   onPageChanged: (int index) {
                //     controller.currentPageNotifier.value = index;
                //   },
                //   children: const <Widget>[
                //
                //   ],
                // ),
                child: Obx(() {
                  return PageView.builder(
                      onPageChanged: (int index) {
                        print(controller.list[index].location_name);
                        controller.currentPageNotifier.value = index;
                        controller.count.value = index;
                        print(controller.count.value);
                      },
                      itemCount: controller.list.length,
                      itemBuilder: (BuildContext context, int pageIndex) {
                        return CloudPageView(controller.list[pageIndex].location_name);
                      });
                }),
              )
            ],
          ),
        ));
  }

  _buildCircleIndicator() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return CirclePageIndicator(
            itemCount: controller.list.length,
            currentPageNotifier: controller.currentPageNotifier,
          );
        }));
  }
}
