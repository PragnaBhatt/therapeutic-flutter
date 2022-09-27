import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constants/color_constants.dart';

import '../../constants/size_constants.dart';

class CustomWidgets {
  static Widget customTextWidget({
    required dataToPrint,
    customFontsize = SizeConstants.FONT_SIZE,
    customAlignment = Alignment.centerLeft,
    customColor = ColorConstants.color_font,
    customMaxlines = 2,
    customMinLines = 2,
  }) {
    return Align(
      alignment: customAlignment,
      child: Text(
        dataToPrint,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: customMaxlines,
        style: TextStyle(
          color: customColor,
          fontSize: customFontsize,
        ),
      ),
    );
  }

  static Function? customClickEvent;
  static Widget customButtonWidget(
      {required btnLbl,
      customFontsize = SizeConstants.FONT_SIZE,
      customAlignment = Alignment.center,
      onCustomClick}) {
    return Align(
      alignment: customAlignment,
      child: ElevatedButton(
          onPressed: () {
            // onCustomClick();
            print("on clicked...");
            //   Navigator.pop(context);
          },
          child: customTextWidget(
              dataToPrint: btnLbl,
              customAlignment: customAlignment,
              customColor: ColorConstants.color_white)),
    );
  }
  
  static Widget noInternetWidget(
      {required image,
      required title,
      required description,
      required buttonText,
      required onPressed}) {
    return   Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(
                image,
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
               style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
              
                onPressed: onPressed,
                child: Text(buttonText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
