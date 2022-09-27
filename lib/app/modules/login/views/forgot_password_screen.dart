import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:therapeutic/app/commons/utils/validations.dart';

import '../../../commons/widgets/custom_widget.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/size_constants.dart';

class ForgotPassword_Screen extends StatelessWidget {
  static String roteName = "/forgot-password";
  ForgotPassword_Screen({Key? key}) : super(key: key);
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    emailController.text = "pragnav@gmail.com";
    return Scaffold(
      appBar: AppBar(
        title: CustomWidgets.customTextWidget(
            dataToPrint: "Forgot Password",
            customColor: ColorConstants.color_white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SizeConstants.FORM_PADDING),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  validator: (input) {
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
                  },
                  style: const TextStyle(
                      fontSize: SizeConstants.FONT_SIZE,
                      color: ColorConstants.color_black),
                  decoration: const InputDecoration(
                    labelText: "Enter Email Address",
                    hintText: " Email ",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                // const SizedBox(
                //   height: SizeConstants.SIZEDBOX_20,
                // ),
                Padding(
                  padding: const EdgeInsets.all(SizeConstants.SIZEDBOX_10),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("api will call");
                          // AdminAPIs.forgotPasswordOtp(
                          //         emailController.text.toString().trim())
                          //     .then((response) async {
                          //   var responseJson =
                          //       (await response.stream.bytesToString());
                          //   print("response..in dart.${responseJson}");
                          //   if (response.statusCode == 200) {
                          // //    print("response..in dart.${responseJson}");
                          //     // print("response...${json.encode(responseJson)}");
                          //     // print("response...${json.encode(response)}");

                          //     var model = ForgotPassword_OTPModel.fromJson(
                          //         json.decode(responseJson));
                          //     print(model.message);
                          //     CommonDialogs.showMsgDialog(
                          //       msg: model.message.toString(),
                          //       ctx: context,
                          //       onOkClick: () {
                          //         Navigator.pop(context);
                          //       },
                          //     );
                          //   } else {
                          //     CommonDialogs.showMsgDialog(
                          //       msg: json.decode(responseJson)['message'],
                          //       // msg: responseJson,
                          //       ctx: context,
                          //       onOkClick: () {
                          //         Navigator.pop(context);
                          //       },
                          //     );
                          //   }
                          // }).onError((error, stackTrace) {
                          //   CommonDialogs.showMsgDialog(
                          //     msg: error.toString(),
                          //     ctx: context,
                          //     onOkClick: () {
                          //       Navigator.pop(context);
                          //     },
                          //   );
                          // });
                        }
                      },
                      child: CustomWidgets.customTextWidget(
                          dataToPrint: "Submit",
                          customColor: ColorConstants.color_white,
                          customAlignment: Alignment.center)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
