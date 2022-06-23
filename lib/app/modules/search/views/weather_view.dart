import 'package:flutter/material.dart';

import '../../../values/app_assets_source.dart';

Widget checkConditions(double wetherCelsious) {
  if(wetherCelsious>30){
    return Image.asset(AppAssetSource.clouds);
  }else if(wetherCelsious<20){
    return Image.asset(AppAssetSource.sun);
  }else{
    return Image.asset(AppAssetSource.cloud_all);
  }
}
