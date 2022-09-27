import 'package:get/get.dart';

class CommonController extends GetxController {
  late String USER_EMAIL = "USER_EMAIL";
  late String USER_ID = "USER_ID";
  late String USER_NAME = "USER_NAME";
  late String USER_TOKEN = "USER_TOKEN";
  late String USER_PASSWORD = "USER_PASSWORD";

  CommonController(
      {required this.USER_EMAIL,
      required this.USER_ID,
      required this.USER_NAME,
      required this.USER_TOKEN,
      required this.USER_PASSWORD});
}
