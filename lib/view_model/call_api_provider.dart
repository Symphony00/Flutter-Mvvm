import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/api_calling.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'user_model_provider.dart';

import '../utils/routes/utils.dart';

class CallingApiProvider with ChangeNotifier {
  CallApi _myRepo = CallApi();
  UserModelProvider userProvider = UserModelProvider();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> callLoginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.callLoginApi(data).then((value) {
      print(value);
      if (kDebugMode) {
        // userProvider.saveUser(value);
        setLoading(false);
        Navigator.pushNamed(context, RoutesNames.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.showFlushBar(error.toString(), context);
        setLoading(false);
        print(error.toString());
        print("inside error");
      }
    });
  }

  Future<void> callRegisterApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.callRegisterApi(data).then((value) {
      if (kDebugMode) {
        setSignUpLoading(false);
        Navigator.pushNamed(context, RoutesNames.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.showFlushBar(error.toString(), context);
        setSignUpLoading(false);
        print(error.toString());
      }
    });
  }
}
