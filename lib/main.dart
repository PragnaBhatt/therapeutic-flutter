import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/login/controllers/login_controller.dart';

import 'app/commons/utils/custom_error.dart';
import 'app/config/theme/app_theme.dart';
import 'app/config/theme/theme_service.dart';
import 'app/config/theme/themes.dart';
import 'app/routes/app_pages.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // initializing the firebase app
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  Get.put(LoginController(USER_TOKEN: "",USER_PASSWORD: "",USER_NAME: "",USER_ID: "",USER_EMAIL: "",PHOTO: ""));

  ErrorWidget.builder = (FlutterErrorDetails details) {
    // If we're in debug mode, use the normal error widget which shows the error
    // message:
    // if (kDebugMode) {
    //   return ErrorWidget(details.exception);
    // }
    // In release builds, show a yellow-on-blue message instead:
    /* return Container(
      alignment: Alignment.center,
      child: Text(
        'Error!\n${details.exception}',
        style: const TextStyle(color: Colors.yellow),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
    );*/

    return CustomError(
      errorDetails: details,
    );
  };
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      //  color: CupertinoColors.separator,
    //  theme: _buildTheme(Brightness.dark),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
    /*  theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,*/
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      getPages: AppPages.routes,
    ),

  );
}

/*ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness,
    primaryColor: ColorConstants.colorPrimary1,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.biryaniTextTheme(baseTheme.textTheme),
  );
}*/
/*ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(
      brightness: brightness,
      // primaryColor: ColorConstants.colorPrimary1,

      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: ColorConstants.colorPrimary1));

  return baseTheme.copyWith(
    textTheme: GoogleFonts.biryaniTextTheme(baseTheme.textTheme),
  );
}*/
