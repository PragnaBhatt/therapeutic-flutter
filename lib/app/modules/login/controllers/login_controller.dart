import 'package:get/get.dart';
import 'package:therapeutic/app/modules/login/models/login_model.dart';
import 'package:therapeutic/app/modules/login/provider/login_provider.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  LoginProvider? loginProvider;

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
}
