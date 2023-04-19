import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view_model/user_model_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  Future<void> authenticateUser(BuildContext context) async {
    Future<UserModel> getUserModel() => UserModelProvider().getUser();

    getUserModel().then((value) {
      if (value.token == null || value.token == '') {
        Navigator.pushNamed(context, RoutesNames.login);
      } else {
        Navigator.pushNamed(context, RoutesNames.home);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
