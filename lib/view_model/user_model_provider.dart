import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserModelProvider with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    final sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
