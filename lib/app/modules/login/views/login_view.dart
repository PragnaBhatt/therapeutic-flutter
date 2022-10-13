import 'dart:convert';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapeutic/app/commons/connectivity/checker.dart';
import 'package:therapeutic/app/commons/utils/shared_pref_names.dart';
import 'package:therapeutic/app/commons/utils/validations.dart';
import 'package:therapeutic/app/commons/widgets/custom_widget.dart';
import 'package:therapeutic/app/config/config.dart';
import 'package:therapeutic/app/modules/login/controllers/login_controller.dart';
import 'package:therapeutic/app/modules/login/models/login_model.dart';
import 'package:therapeutic/app/modules/login/provider/login_provider.dart';

import '../../../commons/controller/common_controller.dart';
import '../../../commons/utils/dialogs.dart';
import '../../../commons/utils/wave.dart';
import '../../../config/theme/theme_service.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/size_constants.dart';
import '../../../routes/app_pages.dart';

class LoginView extends StatefulWidget {
  static const routeName = "/Login-Screen";

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late GlobalKey _formKey;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late SharedPreferences sharedPref;
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  late String userPassword = "", userEmail = "";
  late int stepCleared = -1;
  LoginController? loginController;

  @override
  void initState() {
    // var internetChecker = Get.find<Checker>();
    loginController = Get.find<LoginController>();

    pref.then((SharedPreferences sharedPreferences) {
      sharedPref = sharedPreferences;
      userEmail = sharedPref.getString(ShredPrefNames.USER_EMAIL)!;
      userPassword = sharedPref.getString(ShredPrefNames.USER_PASSWORD)!;
      stepCleared = sharedPref.getInt(ShredPrefNames.STEP_CLEARED)!;
      if (userEmail != null &&
          userPassword != null &&
          userEmail.isNotEmpty &&
          userPassword.isNotEmpty) {
        //&& stepCleared == 3) {
        emailController.text = userEmail;
        passwordController.text = userPassword;
        //   setState(() {});
        // doLogin(_formKey);
      } else if (stepCleared == 1) {
        Get.offAndToNamed(Routes.VERYFY_USER);
      }
    }).catchError((error) {
      SnackBar(
        content: CustomWidgets.customTextWidget(
            dataToPrint: "issue in to initiating data"),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  doLogin(_formKey) async {
    if (_formKey.currentState!.validate()) {
      print("in to valid state");

      loginController!
          .doLogin(emailController.text.toString().trim(),
              passwordController.text.toString().trim())
          .then((LoginModel value) {
        CommonDialogs.showToast(ctx: context, msg: value.message!);
        if (value.status == 1) {
          sharedPref.setString(ShredPrefNames.USER_EMAIL, value.user!.email!);
          sharedPref.setString(ShredPrefNames.USER_NAME, value.user!.name!);
          sharedPref.setString(ShredPrefNames.USER_ID, value.user!.sId!);
          sharedPref.setString(ShredPrefNames.USER_PHOTO, value.user!.photo!);
          sharedPref.setString(
              ShredPrefNames.USER_TOKEN, value.user!.tokens![0]!.token!);
          sharedPref.setString(ShredPrefNames.USER_PASSWORD,
              passwordController.text.toString().trim());
          sharedPref.setInt(ShredPrefNames.STEP_CLEARED, 3);
          Config.token = value.user!.tokens![0]!.token!;

          Get.put(LoginController(
            USER_EMAIL: value.user!.email!,
            USER_ID: value.user!.sId!,
            USER_NAME: value.user!.name!,
            USER_PASSWORD: passwordController.text.toString().trim(),
            USER_TOKEN: value.user!.tokens![0]!.token!,
            PHOTO: value.user!.photo!,
          ));

          Get.offAndToNamed(Routes.HOME);
        }
      });

      // AdminAPIs.loginUser(emailController.text.toString().trim(),
      //         passwordController.text.toString().trim())
      //     .then((streamedResponse) async {
      //   var responseJson = (await streamedResponse.stream.bytesToString());

      //   if (streamedResponse.statusCode == 200) {
      //     var model = LoginModel.fromJson(json.decode(responseJson));
      //     print(model.message);
      //     sharedPref.setString(
      //         ShredPrefNames.USER_EMAIL, model.data!.details!.email!);
      //     sharedPref.setString(
      //         ShredPrefNames.USER_NAME, model.data!.details!.userName!);
      //     sharedPref.setString(
      //         ShredPrefNames.USER_ID, model.data!.details!.sId!);
      //     sharedPref.setString(ShredPrefNames.USER_TOKEN, model.data!.token!);
      //     sharedPref.setString(ShredPrefNames.USER_PASSWORD,
      //         passwordController.text.toString().trim());

      //     //   Navigator.pushReplacementNamed(context,Route.)
      //     Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
      //   } else {
      //     CommonDialogs.showMsgDialog(
      //       msg: json.decode(responseJson)['message'],
      //       ctx: context,
      //       onOkClick: () {
      //         Navigator.pop(context);
      //       },
      //     );
      //   }
      // }).catchError((e) {
      //   CommonDialogs.showMsgDialog(
      //     msg: e.toString(),
      //     ctx: context,
      //     onOkClick: () {
      //       Navigator.pop(context);
      //     },
      //   );
      // });

      LoginModel loginModel;

      /* loginController!
          .doLogin(emailController.text.toString().trim(),
              passwordController.text.toString().trim())
          .then((value) => {});*/
      //    await APIImplementer()
      //        .loginUser(
      //            email: emailController.text.toString().trim(),
      //            password: passwordController.text.toString().trim())
      //        .then((value) => {
      //              if (value != null)
      //                {
      //                  print("in to login response... " + value.toString()),
      //                  loginModel = LoginModel.fromJson(value.data),
      //                    sharedPref.setString(
      //                      ShredPrefNames.USER_EMAIL, loginModel.user!.email!),
      //                  sharedPref.setString(
      //                      ShredPrefNames.USER_NAME, loginModel.user!.name!),
      //                  sharedPref.setString(
      //                      ShredPrefNames.USER_ID, loginModel.user!.sId!),
      //                  sharedPref.setString(
      //                      ShredPrefNames.USER_TOKEN,
      //                      loginModel
      //                          .user!
      //                          .tokens![loginModel.user!.tokens!.length - 1]
      //                          .token!),
      //                  sharedPref.setString(ShredPrefNames.USER_PASSWORD,
      //                      passwordController.text.toString().trim()),
      //
      //                  Get.put<CommonController>(CommonController(
      //                      USER_EMAIL: loginModel.user!.email!,
      //                      USER_ID: loginModel.user!.sId!,
      //                      USER_NAME: loginModel.user!.name!,
      //                      USER_TOKEN: loginModel
      //                          .user!
      //                          .tokens![loginModel.user!.tokens!.length - 1]
      //                          .token!,
      //                      USER_PASSWORD:
      //                          passwordController.text.toString().trim())),
      //
      // // Get.put(PostController()),
      //
      //  CommonDialogs.showToast(
      //                      ctx: context, msg: loginModel.message!),
      //                  Get.offAndToNamed(Routes.HOME));
      //                  /*Provider.of<ProductProvider>(context, listen: false)
      //              .getProducts()
      //              .then((value) {
      //            Navigator.pushReplacementNamed(
      //                context, DashboardScreen.routeName);
      //          })*/
      //                  ,
      //                }
      //            });
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isSignIn = false;
  bool google = false;
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/login.svg';
    // var height=MediaQuery.of(context).he
    _formKey = GlobalKey<FormState>();
    bool isShow = true;

    return Scaffold(
      //backgroundColor: context.theme.backgroundColor,
      // backgroundColor: ColorConstants.colorCanvas,
      backgroundColor: ColorConstants.colorPrimary,
      // appBar: AppBar(
      //     title: CustomWidgets.customTextWidget(
      //         dataToPrint: "Login",
      //         customColor: ColorConstants.color_white,
      //         customFontsize: SizeConstants.FONT_SIZE_HEADER)),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  /*  InkWell(
                      child: Container(
                          margin: EdgeInsets.only(top: 25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/google.jpg'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                'Sign in with Google',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ))),
                      onTap: () async {
                        GoogleSignIn googleSignIn = GoogleSignIn();
                        GoogleSignInAccount? googleSignInAccount =
                            await googleSignIn.signIn();

                        // if (googleSignInAccount != null) {
                        //   final GoogleSignInAuthentication googleSignInAuthentication =
                        //   await googleSignInAccount.authentication;
                        //   final AuthCredential authCredential = GoogleAuthProvider.credential(
                        //       idToken: googleSignInAuthentication.idToken,
                        //       accessToken: googleSignInAuthentication.accessToken);
                        //
                        //   // Getting users credential
                        //   UserCredential result = await auth.signInWithCredential(authCredential);
                        //   //  User user = result.user;
                        //
                        //   if (result != null) {
                        //     print("result not null");
                        //   //  Navigator.pushReplacement(
                        //      //   context, MaterialPageRoute(builder: (context) => HomePage()));
                        //   } // if result not null we simply call the MaterialpageRoute,
                        //   // for go to the HomePage screen
                        // }
                      }),*/
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: context.theme.backgroundColor,
                  //       padding:
                  //       const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  //       textStyle: const TextStyle(
                  //           fontSize: 16, fontWeight: FontWeight.bold),
                  //     ),
                  //     onPressed:ThemeService().switchTheme,
                  //     child: const Text('Change Theme')),
                  if (isShow)
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Opacity(
                        //semi red clippath with more height and with 0.5 opacity
                        opacity: 0.3,
                        child: ClipPath(
                          clipper: WaveClipper(), //set our custom wave clipper
                          child: Container(
                            color: ColorConstants.color_white,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                  if (isShow)
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SvgPicture.asset(
                          assetName,
                          semanticsLabel: 'Login',
                          alignment: Alignment.center,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                ],
              ),
              if (isShow)
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Card(
                    //  color: ColorConstants.color_primary_with_65_opacity.withOpacity(0.5),
                    //color: ColorConstants.color_accent_with_10_opacity,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          // SvgPicture.asset(
                          //   assetName,
                          //   semanticsLabel: 'Login',
                          //   alignment: Alignment.center,
                          //   width: 180,
                          //   height: 180,
                          // ),
                          const SizedBox(
                            height: SizeConstants.SIZEDBOX_10,
                          ),
                          const Text(
                            "Login with your credentials",
                            style: TextStyle(
                              fontSize: SizeConstants.FONT_SIZE_HEADER,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConstants.SIZEDBOX_16,
                          ),
                          const SizedBox(
                            height: SizeConstants.SIZEDBOX_16,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  validator: (input) {
                                    if (input == null ||
                                        input.toString().trim().isEmpty) {
                                      return 'Please enter valid email address';
                                    }
                                    if (!input.toString().isValidEmail()) {
                                      return 'Please enter valid email address';
                                    }
                                    // if (input.toString().isValidEmail()) {
                                    //   return _emailAddress = input.toString();
                                    // }
                                    return null;
                                  },
                                  style: const TextStyle(
                                    fontSize: SizeConstants.FONT_SIZE,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Enter Email Address",
                                    hintText: " Email ",
                                    prefixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: SizeConstants.SIZEDBOX_10,
                                ),
                                TextFormField(
                                  obscureText: isObscure,
                                  controller: passwordController,
                                  validator: (input) {
                                    if (input == null ||
                                        input.toString().trim().isEmpty) {
                                      return "Please provide password";
                                    }
                                    //   return _password = input;
                                    return null;
                                  },
                                  // obscureText: true,
                                  style: const TextStyle(
                                    fontSize: SizeConstants.FONT_SIZE,
                                  ),
                                  decoration: InputDecoration(
                                      labelText: "Enter Password",
                                      hintText: " Password ",
                                      prefixIcon: Icon(Icons.password),
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            print("clicked....");
                                            isObscure = !isObscure;
                                            setState(() {});
                                          },
                                          child: Icon(isObscure
                                              ? Icons.visibility_off
                                              : Icons.visibility)),
                                      border: OutlineInputBorder()),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: SizeConstants.SIZEDBOX_10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(12.0)),
                              onPressed: (() {
                                // print("login..." + _emailAddress);
                                print("login..." + emailController.text);
                                print("login..." + passwordController.text);

                                doLogin(_formKey);
                              }),
                              child: CustomWidgets.customTextWidget(
                                  dataToPrint: "Login",
                                  customColor: ColorConstants.color_white,
                                  customAlignment: Alignment.center),
                            ),
                          ),
                          const SizedBox(
                            height: SizeConstants.SIZEDBOX_10,
                          ),
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: SizeConstants.FONT_SIZE_BUTTON,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConstants.SIZEDBOX_10,
                          ),
                          InkWell(
                            onTap: () {
                              print("on register clickd...");
                              Get.toNamed(Routes.REGISTER);

                              // Navigator.pushNamed(
                              //     context, SignUp_Screen.routeName);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                //     decorationColor: Color_Constants.color_black,
                                fontSize: SizeConstants.FONT_SIZE_BUTTON,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: SizeConstants.SIZEDBOX_10,
                          ),
                          /*InkWell(
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, ForgotPassword_Screen.roteName);
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  //     decorationColor: Color_Constants.color_black,
                                  fontSize: SizeConstants.FONT_SIZE_BUTTON,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.colorPrimary),
                            ),
                          )*/
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
