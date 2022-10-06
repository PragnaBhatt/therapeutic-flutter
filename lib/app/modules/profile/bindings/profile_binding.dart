import 'package:get/get.dart';
import 'package:therapeutic/app/modules/login/controllers/login_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
   /* Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );*/
    Get.lazyPut<LoginController>(
          () => LoginController(USER_TOKEN: "",USER_PASSWORD: "",USER_NAME: "",USER_ID: "",USER_EMAIL: ""),
    );
  }
}
