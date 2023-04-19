import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../res/components/app_urls.dart';

class CallApi {
  BaseApiServices callApiObject = NetworkApiServices();

  Future<dynamic> callLoginApi(dynamic data) async {
    try {
      var response =
          await callApiObject.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> callRegisterApi(dynamic data) async {
    try {
      var response =
          await callApiObject.getPostApiResponse(AppUrls.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
