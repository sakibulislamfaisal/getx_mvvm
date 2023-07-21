import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preference.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();
  void isLogin() {
    userPreference.getUser().then((value) {
      if (kDebugMode) {
        print(value.token);
      }
      if (value.token!.isEmpty || value.token.toString() == 'null') {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.loginView);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.homeView);
        });
      }
    });
  }
}
