import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapeutic/app/commons/utils/dialogs.dart';
import 'package:therapeutic/app/commons/utils/shared_pref_names.dart';
import 'package:therapeutic/app/commons/utils/validations.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/routes/app_pages.dart';
import '../../../commons/widgets/custom_widget.dart';
import '../../../constants/size_constants.dart';
import '../controllers/login_controller.dart';
import '../models/resendOTP_model.dart';
import '../models/verifyuser_model.dart';

class VerifyUser_Screen extends StatefulWidget {
  VerifyUser_Screen({Key? key}) : super(key: key);

  @override
  State<VerifyUser_Screen> createState() => _VerifyUser_ScreenState();
}

class _VerifyUser_ScreenState extends State<VerifyUser_Screen> {
  final controller1 = TextEditingController();
  late SharedPreferences sharedPref;
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  LoginController? loginController;
  late String userEmail;

  @override
  void initState() {
    loginController = Get.find<LoginController>();

    pref.then((SharedPreferences sharedPreferences) {
      sharedPref = sharedPreferences;
      userEmail = sharedPref.getString(ShredPrefNames.USER_VERIFY_EMAIL)!;
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
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: CustomWidgets.customTextWidget(
            dataToPrint: "Submit OTP", customColor: ColorConstants.color_white),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Submit OTP you may find on $userEmail"),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller1,
                    /*  validator: (input) {
                      if (input == null || input.toString().trim().isEmpty) {
                        return 'Please enter valid email address';
                      }
                      if (!input.toString().isValidEmail()) {
                        return 'Please enter valid email address';
                      }
                      // if (input.toString().isValidEmail()) {
                      //   return _emailAddress = input.toString();
                      // }
                      return null;
                    },*/
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: SizeConstants.FONT_SIZE,
                        color: ColorConstants.color_black),
                    decoration: const InputDecoration(
                      // labelText: "Enter Email Address",
                      // hintText: " Email ",
                      // prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: SizeConstants.SIZEDBOX_20,
                // ),
                Padding(
                  padding: const EdgeInsets.all(SizeConstants.SIZEDBOX_10),
                  child: ElevatedButton(
                    onPressed: () {loginController!
                        .doVerifyNewUser(userEmail,controller1.text.toString().trim())
                        .then((VerifyUserModel value) {
                      if (value.status == 1) {
                        CommonDialogs.showMsgDialog(
                            ctx: context,
                            onOkClick: () {
                              print("on ok clicked...");
                              Get.back();
                               Get.offAndToNamed(Routes.LOGIN);
                            },
                            isDismissible: false,
                            msg: value.message!);
                      } else {
                        CommonDialogs.showMsgDialog(
                            ctx: context,
                            onOkClick: () {
                              Get.back();
                            },
                            isDismissible: false,
                            msg: value.message!);
                      }
                    });},
                    child: CustomWidgets.customTextWidget(
                        dataToPrint: "Send OTP",
                        customColor: ColorConstants.color_white,
                        customAlignment: Alignment.center),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      loginController!
                          .doResendOTP(userEmail)
                          .then((ResendOTPModel value) {
                        if (value.status == 1) {
                          CommonDialogs.showMsgDialog(
                              ctx: context,
                              onOkClick: () {
                                Get.back();
                              //  Get.offAndToNamed(Routes.LOGIN);
                              },
                              isDismissible: false,
                              msg: value.message!);
                        } else {
                          CommonDialogs.showMsgDialog(
                              ctx: context,
                              onOkClick: () {
                                Get.back();
                              },
                              isDismissible: false,
                              msg: value.message!);
                        }
                      });
                    },
                    child: Text("resend OTP "))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
