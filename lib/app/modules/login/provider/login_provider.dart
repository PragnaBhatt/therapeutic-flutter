import 'dart:convert';

import 'package:get/get.dart';
import 'package:therapeutic/app/modules/login/models/login_model.dart';
import 'package:http/http.dart' as http;

import '../../../config/config.dart';
import '../../models/product_detail_model.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.30.222:5000/food/fetchFoodTypes';
    super.onInit();
  }

  Future<LoginModel> loginUser(String email, String password) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request =
        http.Request('GET', Uri.parse(Config.baseUrl + 'user/loginUser'));
    request.bodyFields = {'email': email, 'password': password};
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      LoginModel model = new LoginModel();
      model = LoginModel.fromJson(json.decode(res.toString()));
      return model;
    } else {
      print("in to else... fetchFoodProductDetail");
      throw new Exception();
    }
  }
}
