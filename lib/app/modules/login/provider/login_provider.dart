import 'dart:convert';
import 'package:get/get_connect/connect.dart';

import 'package:therapeutic/app/modules/login/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:therapeutic/app/modules/login/models/user_register_model.dart';

import '../../../commons/utils/dialogs.dart';
import '../../../config/config.dart';
import '../../models/product_detail_model.dart';
import '../models/resendOTP_model.dart';
import '../models/verifyuser_model.dart';

class LoginProvider extends GetConnect {
  // String urlToAppend = "food/user/loginUser";
  String urlToAppend = "food/user/";

  @override
  void onInit() {
    //httpClient.baseUrl = 'http://192.168.30.222:5000/food/fetchFoodTypes';
    super.onInit();
  }

  Future<LoginModel> loginUser1(String email, String password) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request =
        http.Request('POST', Uri.parse(Config.baseUrl + 'user/loginUser'));
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

  Future<LoginModel> loginUser(String email, String password) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    //  request.bodyFields = {'id': prodId};
    return await http.post(
        Uri.parse(Config.baseUrl + urlToAppend + "loginUser"),
        headers: headers,
        body: {"email": email, "password": password}).then((value) {
      print("loginUser response... ${value.body}");
      print("${json.encode(value.body)}");
      var jsonData = json.decode(value.body);
      print("${jsonData['status']}");
      //int status = jsonData['status'];
      if (value.statusCode == 200) {
        print("value.statusCode ${value.statusCode}");
        LoginModel note = LoginModel.fromJson(jsonData);
        print(note.message);
        return note;
      } else {
        CommonDialogs.showGetMessage(msg: jsonData['message']);
        throw new Exception(jsonData['message']);
      }
    });
  }

  Future<UserRegisterModel> doRegister(String name, String email,
      String password, http.MultipartFile file) async {
    print("here...");
    late UserRegisterModel model = UserRegisterModel();
    var req = http.MultipartRequest(
        "POST", Uri.parse(Config.baseUrl + urlToAppend + "createNewUser"));
    req.files.add(file);
    req.fields.addAll({
      'name': name,
      'email': email,
      'password': password,
    });

    /*  req.send().then((value) async {
      var res = await value.stream.bytesToString();
      print("Res.... ${res}");
      if (value.statusCode == 201) {
         model = new UserRegisterModel();
        model = UserRegisterModel.fromJson(json.decode(res.toString()));
        return model;
      } else {
        CommonDialogs.showGetDialog(
            msg: "${value.statusCode}  ${res.toString()}");return model;
      }
    });*/

    var value = await req.send();
    var res = await value.stream.bytesToString();
    print("Res.... ${res}");
    if (value.statusCode == 200) {
      model = new UserRegisterModel();
      model = UserRegisterModel.fromJson(json.decode(res.toString()));
      return model;
    } else {
      CommonDialogs.showGetDialog(
          msg: "${value.statusCode}  ${res.toString()}");
      //  CommonDialogs.showGetMessage(msg: jsonData['message']);
      throw new Exception(res.toString());
    }

    // return model;
  }

  Future<VerifyUserModel> verifyUser(String email, String OTP) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    //  request.bodyFields = {'id': prodId};
    return await http.post(
        Uri.parse(Config.baseUrl + urlToAppend + "verifyNewUser"),
        headers: headers,
        body: {"email": email, "OTP": OTP}).then((value) {
      print("verifyNewUser response... ${value.body}");
      print("${json.encode(value.body)}");
      var jsonData = json.decode(value.body);
      print("${jsonData['status']}");
      //int status = jsonData['status'];
      if (value.statusCode == 200) {
        print("value.statusCode ${value.statusCode}");
        VerifyUserModel note = VerifyUserModel.fromJson(jsonData);
        print(note.message);
        return note;
      } else {
        CommonDialogs.showGetMessage(msg: jsonData['message']);
        throw new Exception(jsonData['message']);
      }
    });
  }

  Future<ResendOTPModel> resendOTP(String email) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    //  request.bodyFields = {'id': prodId};
    return await http.post(
        Uri.parse(Config.baseUrl + urlToAppend + "reSendOTP"),
        headers: headers,
        body: {"email": email}).then((value) {
      print("reSendOTP response... ${value.body}");
      print("${json.encode(value.body)}");
      var jsonData = json.decode(value.body);
      print("${jsonData['status']}");
      //int status = jsonData['status'];
      if (value.statusCode == 200) {
        print("value.statusCode ${value.statusCode}");
        ResendOTPModel note = ResendOTPModel.fromJson(jsonData);
        print(note.message);
        return note;
      } else {
        CommonDialogs.showGetMessage(msg: jsonData['message']);
        throw new Exception(jsonData['message']);
      }
    });
  }
}
