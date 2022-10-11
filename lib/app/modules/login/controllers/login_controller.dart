import 'package:get/get.dart';
import 'package:therapeutic/app/modules/login/models/login_model.dart';
import 'package:therapeutic/app/modules/login/provider/login_provider.dart';

import '../models/resendOTP_model.dart';
import '../models/user_register_model.dart';
import 'package:http/http.dart' as http;

import '../models/verifyuser_model.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  LoginProvider? loginProvider;

  // RxString token = "".obs;
  // RxBool isLogin=false.obs;
  late String USER_EMAIL = "USER_EMAIL";
  late String USER_ID = "USER_ID";
  late String USER_NAME = "USER_NAME";
  late String USER_TOKEN = "USER_TOKEN";
  late String USER_PASSWORD = "USER_PASSWORD";
  late String PHOTO = "PHOTO";

  LoginController(
      {required this.USER_EMAIL,
      required this.USER_ID,
      required this.USER_NAME,
      required this.USER_TOKEN,
      required this.USER_PASSWORD,
      required this.PHOTO



      });

  @override
  void onInit() {
    loginProvider = LoginProvider();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<LoginModel> doLogin(String email, String password) {
    print("login api called...");
    return loginProvider!.loginUser(email, password);
  }

  Future<VerifyUserModel> doVerifyNewUser(String email, String OTP) {
    print("doVerifyNewUser api called...");
    return loginProvider!.verifyUser(email, OTP);
  }

  Future<ResendOTPModel> doResendOTP(String email) {
    print("doResendOTP api called...");
    return loginProvider!.resendOTP(email);
  }

  Future<UserRegisterModel> doRegister(
      String name, String email, String password, http.MultipartFile file) {
    print("doRegister api called...");
    return loginProvider!.doRegister(name, email, password, file);
  }
}
