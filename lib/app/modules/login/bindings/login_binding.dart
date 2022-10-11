import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(USER_TOKEN: "",USER_PASSWORD: "",USER_NAME: "",USER_ID: "",USER_EMAIL: "",PHOTO: ""),
    );
  }
}
