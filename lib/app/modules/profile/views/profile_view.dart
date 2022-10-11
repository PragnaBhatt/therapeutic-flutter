import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/login/controllers/login_controller.dart';
import 'package:therapeutic/app/routes/app_pages.dart';

import '../../../commons/utils/dialogs.dart';
import '../../../commons/utils/shared_pref_names.dart';
import '../../../commons/widgets/custom_widget.dart';
import '../../../config/config.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late SharedPreferences sharedPref;
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  String userEmail = "", userPhoto = "", userName = "";

  @override
  void initState() {
    pref.then((SharedPreferences sharedPreferences) {
      sharedPref = sharedPreferences;
      userEmail = sharedPref.getString(ShredPrefNames.USER_EMAIL)!;
      userPhoto = sharedPref.getString(ShredPrefNames.USER_PHOTO)!;
      userName = sharedPref.getString(ShredPrefNames.USER_NAME)!;
      setState(() {});
    }).catchError((error) {
      SnackBar(
        content: CustomWidgets.customTextWidget(
            dataToPrint: "issue in to initiating data"),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("image....${Config.baseUrl}${userPhoto}");
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '${Config.baseUrl}${userPhoto}',
                  height: 160,
                  width: 160,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 20,
            ),
            Text(userName),
            SizedBox(
              height: 20,
            ),
            Text(userEmail),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              // color: ColorConstants.colorPrimary,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                CommonDialogs.showMsgDialog2(
                    ctx: context,
                    onCancelClick: () {
                      Get.back();
                    },
                    onOkClick: () {
                      Get.put(LoginController(
                          USER_TOKEN: "",
                          USER_PASSWORD: "",
                          USER_NAME: "",
                          USER_ID: "",
                          USER_EMAIL: "",
                          PHOTO: ""));

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
                    msg: "Are you sure to do logout ?",
                    isDismissible: true);
              },
              child: Text(
                'LogOut',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
