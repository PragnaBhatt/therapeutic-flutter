import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapeutic/app/modules/login/controllers/login_controller.dart';
import 'package:therapeutic/app/routes/app_pages.dart';

import '../../../commons/utils/shared_pref_names.dart';
import '../../../commons/widgets/custom_widget.dart';
import '../../../config/config.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<LoginController> {
  ProfileView({Key? key}) : super(key: key);
  late SharedPreferences sharedPref;
  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Get.put(LoginController(
                USER_TOKEN: "",
                USER_PASSWORD: "",
                USER_NAME: "",
                USER_ID: "",
                USER_EMAIL: ""));

            pref.then((SharedPreferences sharedPreferences) {
              sharedPref = sharedPreferences;
              sharedPref.setString(ShredPrefNames.USER_EMAIL, "");
              sharedPref.setString(ShredPrefNames.USER_NAME, "");
              sharedPref.setString(ShredPrefNames.USER_ID, "");
              sharedPref.setString(ShredPrefNames.USER_TOKEN, "");
              sharedPref.setString(ShredPrefNames.USER_PASSWORD, "");

              Config.token = "";
              Get.offAndToNamed(Routes.LOGIN);
            }).catchError((error) {
              SnackBar(
                content: CustomWidgets.customTextWidget(
                    dataToPrint: "issue in to initiating data"),
              );
            });
          },
          child: Text(
            'LogOut',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
