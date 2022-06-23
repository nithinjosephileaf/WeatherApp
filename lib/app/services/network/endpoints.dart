import 'package:weather_app/app/services/network/http_client.dart';

import '../../values/constants.dart';
// import 'package:weather_app/app/values/constants.dart';
// import 'package:weather_app/app/values/url_constants.dart';

enum  EndPoint {getWeather}

/// Please use | symbol at position of id to replace
/// Eg _baseUrl+"/user"+"|/"
///

extension URLExtenssion on EndPoint {
  static final String _baseUrl = AppConstants.baseURL;

  // String get url {
  //   switch (this) {
  //     case EndPoint.getConfig:
  //       return _baseUrl + UrlConstants.api + UrlConstants.v1 + UrlConstants.config + '/';
  //
  //     case EndPoint.getAccessToken:
  //       return _baseUrl + UrlConstants.api + UrlConstants.v1 + UrlConstants.user + UrlConstants.getAccessToken + '/';
  //     case EndPoint.register:
  //       return _baseUrl + UrlConstants.api + UrlConstants.v1 + UrlConstants.user + '/';
  //     case EndPoint.updateProfile:
  //       return _baseUrl + UrlConstants.api + UrlConstants.v1 + UrlConstants.user + '/|/';
  //     case EndPoint.sendOtp:
  //       return _baseUrl + UrlConstants.api + UrlConstants.v1 + UrlConstants.user + UrlConstants.sendOtp + '/';
  //     case EndPoint.resetPassword:
  //       return _baseUrl + UrlConstants.api + UrlConstants.v1 + UrlConstants.user + UrlConstants.changePassword + '/';
  //   }
  // }

  String get url{
    switch(this){
      case EndPoint.getWeather:return AppConstants.baseURL;
    }
  }

  /// this method is used to replace | with id
  String cleanUrlWith(String id) {
    return url.replaceAll("|", id);
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    RequestType requestType = RequestType.get;

    switch (this) {
      case EndPoint.getWeather:
        requestType = RequestType.get;
        break;

    }

    return requestType;
  }
}

extension Token on EndPoint {
  bool get shouldAddToken {
    var shouldAdd = false;

    switch (this) {
      case EndPoint.getWeather:
        shouldAdd = false;
        //   case EndPoint.register:
        //     shouldAdd = false;
        //     break;
        //   case EndPoint.getConfig:
        //   case EndPoint.updateProfile:
        //   case EndPoint.sendOtp:
        //   case EndPoint.resetPassword:
        //     shouldAdd = true;
        // }
        return shouldAdd;
    }
  }
}