import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';
import 'package:weather_app/app/values/app_assets_source.dart';
import 'package:weather_app/app/values/colors.dart';

class CloudPageView extends StatelessWidget {
  String location_name;
   CloudPageView(this.location_name, {Key? key}) : super(key: key);
  final controller=Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppAssetSource.cloud_all),
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [

               Text(
                 location_name,
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
            const Text(
              "31  \u2103",
              style: TextStyle(fontSize: 40, fontFamily: "Poppins"),
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
                    Text("uv", style: TextStyle(color: AppColors.greyColor)),
                    Text("4", style: TextStyle(color: AppColors.greyColor))
                  ],
                ),
                Column(
                  children: const [
                    Text("% RAIN", style: TextStyle(color: AppColors.greyColor)),
                    Text("58%", style: TextStyle(color: AppColors.greyColor))
                  ],
                ),
                Column(
                  children: const [
                    Text("AQ", style: TextStyle(color: AppColors.greyColor)),
                    Text("22", style: TextStyle(color: AppColors.greyColor))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
