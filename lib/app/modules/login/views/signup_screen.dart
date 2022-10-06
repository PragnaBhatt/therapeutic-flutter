import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapeutic/app/commons/utils/permission_utils.dart';
import 'package:therapeutic/app/commons/utils/validations.dart';
import 'package:therapeutic/app/commons/widgets/custom_widget.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/login/controllers/login_controller.dart';
import 'package:therapeutic/app/modules/login/views/login_view.dart';
import 'package:therapeutic/app/routes/app_pages.dart';
import '../../../commons/utils/dialogs.dart';
import '../../../commons/utils/shared_pref_names.dart';
import '../../../constants/size_constants.dart';
import 'package:get/get.dart';

import '../models/user_register_model.dart';

class SignUp_Screen extends StatefulWidget {
  static String routeName = '/Signup';

  // LoginController loginController = new LoginController(
  //     USER_EMAIL: "",
  //     USER_ID: "",
  //     USER_NAME: "",
  //     USER_TOKEN: "",
  //     USER_PASSWORD: "");

  @override
  _SignUp_ScreenState createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final userNameController = TextEditingController();
  bool showPwd = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    loginController = Get.find<LoginController>();

    pref.then((SharedPreferences sharedPreferences) {
      sharedPref = sharedPreferences;



    }).catchError((error) {
      SnackBar(
        content: CustomWidgets.customTextWidget(
            dataToPrint: "issue in to initiating data"),
      );
    });
    super.initState();
  }

  late String filePath = "";
  File? imageFile = null;
  late SharedPreferences sharedPref;
  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  // late   File _image;
  late LoginController loginController;

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/login1.svg';
    var _emailAddress = "";

    final _formKey = GlobalKey<FormState>();
    String path = "";

    final picker = ImagePicker();
    void _selectImageFromGallary() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      print("picked image ${pickedFile!.path}");
      //_image=pickedFile as File;
      path = pickedFile.path;
      imageFile = File(path);
      filePath = pickedFile.path;
      print("picked image filePath::: ${path}");

      print("picked image filePath ${filePath}");
      print("picked image filePath ${imageFile?.path}");

      print("is file exists... ${imageFile!.uri}");
      print("is file exists... ${imageFile!.length()}");
      setState(() {});
    }

    print("filePath $filePath");

    return Scaffold(
        //  backgroundColor: ColorConstants.colorCanvas,
        appBar: AppBar(
          title: const Text("Signup"),
        ),
        body: SizedBox(
          width: double.infinity,
          child:

              // Container(
              //     child: Stack(
              //   children: [
              //     Positioned(
              //       top: 10,
              //       child:  Opacity(
              //       //semi red clippath with more height and with 0.5 opacity
              //       opacity: 0.6,
              //       child: ClipPath(
              //         clipper: WaveClipper(), //set our custom wave clipper
              //         child: Container(
              //           color: ColorConstants.orange,
              //           height: 190,
              //         ),
              //       ),
              //     ),),
              //
              //
              //     Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Align(
              //         alignment: Alignment.topCenter,
              //         child: SvgPicture.asset(
              //           assetName,
              //           semanticsLabel: 'SignUp',
              //           alignment: Alignment.center,
              //           width: 180,
              //           height: 180,
              //         ),
              //       ),
              //     ),

              Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // CircleAvatar(
                      //   radius: 80.0,
                      //   backgroundImage: FileImage(imageFile!.path),
                      // )

                      Card(
                        elevation: 8,
                        child: Stack(
                          children: <Widget>[
                            Container(
                                width: 160,
                                height: 160,
                                //  color: ColorConstants.colorCanvas.withOpacity(0.5),
                                child: imageFile != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.file(imageFile!,
                                            height: 160,
                                            width: 160,
                                            fit: BoxFit.fill),
                                      )
                                    : IconButton(
                                        icon: Icon(Icons.add,
                                            size: 60,
                                            color: ColorConstants.colorPrimary),
                                        onPressed: () {
                                          PermissionUtil.checkPermission(
                                                  TargetPlatform.android)
                                              .then((isGranted) {
                                            if (isGranted) {
                                              CommonDialogs
                                                  .showImageSelectionDialog(
                                                ctx: context,
                                                onCameraClick: () async {
                                                  List<Media>? res =
                                                      await ImagesPicker
                                                          .openCamera(
                                                    // pickType: PickType.video,
                                                    pickType: PickType.image,
                                                    quality: 0.8,
                                                    maxSize: 800,
                                                    // cropOpt: CropOption(
                                                    //   aspectRatio: CropAspectRatio.wh16x9,
                                                    // ),
                                                    maxTime: 15,
                                                  );
                                                  print(res);
                                                  if (res != null) {
                                                    print(res[0].path);
                                                    imageFile =
                                                        File(res[0].path);

                                                    filePath = res[0].path;

                                                    setState(() {});
                                                    // setState(() {
                                                    //   path = res[0].thumbPath;
                                                    // });
                                                  }
                                                  Navigator.pop(context);
                                                },
                                                onGalleryClick: () async {
                                                  var status = await Permission
                                                      .storage.status;
                                                  if (!status.isGranted) {
                                                    await Permission.storage
                                                        .request();
                                                  }
                                                  // PermissionUtil.checkPermission(platform)
                                                  //     .then(
                                                  //   (isGranted) async {
                                                  //     if (isGranted != null && isGranted) {
                                                  _selectImageFromGallary();
                                                  //     } else {
                                                  //       print(
                                                  //           'perimssion not granted...........');
                                                  //     }
                                                  //   },
                                                  // );
                                                  Navigator.pop(context);
                                                },
                                                onCancelClick: () {
                                                  Navigator.pop(context);
                                                },
                                              );
                                            } else {
                                              print("not granted");
                                            }
                                          });
                                        },
                                      )),
                            Positioned(
                              top: 0,
                              right: 0,
                              width: 40,
                              height: 40,
                              child: Container(
                                width: 30,
                                height: 30,
                                color:
                                    ColorConstants.color_black.withOpacity(0.4),
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    imageFile = null;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // const SizedBox(
                      //   height: 24,
                      // ),
                      // SvgPicture.asset(
                      //   assetName,
                      //   semanticsLabel: 'Login',
                      //   alignment: Alignment.center,
                      //   width: 180,
                      //   height: 180,
                      // ),
                      // const SizedBox(
                      //   height: SizeConstants.SIZEDBOX_20,
                      // ),
                      // const Text(
                      //   "Create new account",
                      //   style: TextStyle(
                      //       fontSize: SizeConstants.FONT_SIZE_HEADER,
                      //      ),
                      // ),

                      const SizedBox(
                        height: SizeConstants.SIZEDBOX_10,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: userNameController,
                              validator: (input) {
                                if (input == null ||
                                    input.toString().trim().isEmpty) {
                                  return 'Please enter name';
                                }
                                if (input.toString().trim().length < 3) {
                                  return 'Please enter proper name';
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
                                labelText: "Enter Name",
                                hintText: " Name ",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: SizeConstants.SIZEDBOX_10,
                            ),
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
                              controller: passwordController,
                              validator: (input) {
                                if (input == null ||
                                    input.toString().trim().isEmpty) {
                                  return "Please provide password";
                                }
                                //   return _password = input;
                                return null;
                              },
                              obscureText: showPwd,
                              style: const TextStyle(
                                fontSize: SizeConstants.FONT_SIZE,
                              ),
                              decoration: InputDecoration(
                                  labelText: "Enter Password",
                                  hintText: " Password ",
                                  prefixIcon: Icon(Icons.password),
                                  suffixIcon: IconButton(
                                    icon: showPwd
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                    onPressed: () {
                                      showPwd = !showPwd;
                                      setState(() {});
                                    },
                                  ),
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: SizeConstants.SIZEDBOX_10,
                            ),
                            TextFormField(
                              controller: confirmPasswordController,
                              validator: (input) {
                                if (input == null ||
                                    input.toString().trim().isEmpty) {
                                  return "Please provide confirm password";
                                }
                                //   return _password = input;
                                return null;
                              },
                              obscureText: showPwd,
                              style: const TextStyle(
                                fontSize: SizeConstants.FONT_SIZE,
                              ),
                              decoration: const InputDecoration(
                                  labelText: "Enter Confirm Password",
                                  hintText: "Confirm Password ",
                                  prefixIcon: Icon(Icons.password),
                                  // suffixIcon: Icon(Icons.visibility),
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
                            print("login..." + _emailAddress);
                            print("login..." + emailController.text);
                            print("login..." + passwordController.text);
                            // loginUser();
                            if (_formKey.currentState!.validate()) {
                              print("in to valid state");
                              if (passwordController.text.trim().compareTo(
                                      confirmPasswordController.text.trim()) ==
                                  0) {
                                if (filePath.isNotEmpty) {
                                  print("api call");
                                  // AdminAPIs.addUser(
                                  //     context,
                                  //     userNameController.text
                                  //         .toString()
                                  //         .trim(),
                                  //     emailController.text.toString().trim(),
                                  //     passwordController.text
                                  //         .toString()
                                  //         .trim(),
                                  //     filePath);
                                } else {
                                  CommonDialogs.showMsgDialog(
                                      ctx: context,
                                      onOkClick: () {
                                        Navigator.pop(context);
                                      },
                                      msg: "Please add Image");
                                }
                              } else {
                                CommonDialogs.showMsgDialog(
                                    ctx: context,
                                    onOkClick: () {
                                      Navigator.pop(context);
                                    },
                                    msg:
                                        "Password and confirm password not matches");
                              }
                            }
                          }),
                          child: InkWell(
                            onTap: () async {
                              var file = await http.MultipartFile.fromPath(
                                  'userPhoto', filePath);

                              loginController
                                  .doRegister(
                                      userNameController.text.trim().toString(),
                                      emailController.text.trim().toString(),
                                      passwordController.text.trim(),
                                      file)
                                  .then((value) {
                                print("this is data111...${value.toString()}");

                                // CommonDialogs.showMsgDialog(
                                //     msg: value.message!);
                               /* CommonDialogs.showMsgDialog(
                                    ctx: context,
                                    onOkClick: () {
                                      sharedPref.setString(
                                          ShredPrefNames.USER_VERIFY_EMAIL,
                                          value.user!.email!).then((value){
                                            Get.back();
                                      Get.offAndToNamed(Routes.VERYFY_USER);} );

                                    },
                                    msg: value.message!,
                                    isDismissible: true);*/
                                // Get.offAndToNamed(LoginView.routeName);

                                sharedPref.setString(
                                    ShredPrefNames.USER_VERIFY_EMAIL,
                                    value.user!.email!).then((sv) {
                                  CommonDialogs.showToast(ctx: context,
                                      msg: value.message!.toString());
                                  Get.back();
                                  Get.offAndToNamed(Routes.VERYFY_USER);
                                });


                              });
                            },
                            child: CustomWidgets.customTextWidget(
                                dataToPrint: "SignUp",
                                customColor: ColorConstants.color_white,
                                customAlignment: Alignment.center),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConstants.SIZEDBOX_10,
                      ),

                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Text(
                          "Back to Login",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              //     decorationColor: Color_Constants.color_black,
                              fontSize: SizeConstants.FONT_SIZE_BUTTON,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.colorPrimary),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
    //     ],
    //   )),
    // ),
    // );
  }
}
