import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapeutic/app/commons/utils/validations.dart';
import 'package:therapeutic/app/constants/color_constants.dart';

import '../../../commons/widgets/custom_widget.dart';
import '../../../constants/size_constants.dart';

class VerifyUser_Screen extends StatelessWidget {
  VerifyUser_Screen({Key? key}) : super(key: key);
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: CustomWidgets.customTextWidget(
            dataToPrint: "Submit OTP", customColor: ColorConstants.color_white),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
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
              ),
              // const SizedBox(
              //   height: SizeConstants.SIZEDBOX_20,
              // ),
              Padding(
                padding: const EdgeInsets.all(SizeConstants.SIZEDBOX_10),
                child: ElevatedButton(
                    onPressed: () {},
                    child: CustomWidgets.customTextWidget(
                        dataToPrint: "Send OTP",
                        customColor: ColorConstants.color_white,
                        customAlignment: Alignment.center),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
