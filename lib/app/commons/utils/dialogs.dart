

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:therapeutic/app/commons/widgets/custom_widget.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/constants/size_constants.dart';
import 'package:therapeutic/app/constants/string_constants.dart';

import '../../routes/app_pages.dart';

class CommonDialogs {
  static Future<void> showImageSelectionDialog({
    required BuildContext ctx,
    String msg = 'Please wait..',
    bool isDismissible = false,
    required Function onCameraClick,
    required Function onGalleryClick,
    required Function onCancelClick,
  }) async {
    return showDialog(
      barrierDismissible: isDismissible,
      context: ctx,
      builder: (ctx) => AlertDialog(
        elevation: 12,
        actions: [
          // Custom_Widgets.customButtonWidget(
          //     btnLbl: "Cancel",
          //     onCustomClick: {print("button clicked..."), onCancelClick()}),
          //  Custom_Widgets.customButtonWidget(btnLbl: "", onCustomClick: {}),
          ElevatedButton(
              onPressed: () {
                onCancelClick();
              },
              child: CustomWidgets.customTextWidget(
                  dataToPrint: "Cancel",
                  customAlignment: Alignment.center,
                 ))
          // ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomWidgets.customTextWidget(
                dataToPrint: "Select Any",
                customAlignment: Alignment.center,
                customFontsize: SizeConstants.FONT_SIZE_HEADER),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: ColorConstants.colorDivider),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print("on camera clicked ");
                onCameraClick();
              },
              child: Row(
                children: [
                  const Icon(Icons.camera),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomWidgets.customTextWidget(dataToPrint: "Camera"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print("on gallery clicked ");
                onGalleryClick();
              },
              child: Row(
                children: [
                  const Icon(Icons.browse_gallery),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomWidgets.customTextWidget(dataToPrint: "Gallery"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // static Future<void> showImageSelectionDialog({
  //   required BuildContext ctx,
  //   String msg = 'Please wait..',
  //   bool isDismissible = false,
  //   required Function onCameraClick,
  //   required Function onGalleryClick,
  //   required Function onCancelClick,
  // }) async {
  //   return showDialog(
  //     barrierDismissible: isDismissible,
  //     context: ctx,
  //     builder: (ctx) => AlertDialog(
  //       elevation: 12,
  //       actions: [
  //         // Custom_Widgets.customButtonWidget(
  //         //     btnLbl: "Cancel",
  //         //     onCustomClick: {print("button clicked..."), onCancelClick()}),
  //         //  Custom_Widgets.customButtonWidget(btnLbl: "", onCustomClick: {}),
  //         ElevatedButton(
  //             onPressed: () {
  //               onCancelClick();
  //             },
  //             child: CustomWidgets.customTextWidget(
  //                 dataToPrint: "Cancel",
  //                 customAlignment: Alignment.center,
  //                 customColor: ColorConstants.color_white))
  //         // ),
  //       ],
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           CustomWidgets.customTextWidget(
  //               dataToPrint: "Select Any",
  //               customAlignment: Alignment.center,
  //               customFontsize: SizeConstants.FONT_SIZE_HEADER),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           const Divider(color: ColorConstants.colorDivider),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           InkWell(
  //             onTap: () {
  //               print("on camera clicked ");
  //               onCameraClick();
  //             },
  //             child: Row(
  //               children: [
  //                 const Icon(Icons.camera),
  //                 const SizedBox(
  //                   width: 10,
  //                 ),
  //                 CustomWidgets.customTextWidget(dataToPrint: "Camera"),
  //               ],
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           InkWell(
  //             onTap: () {
  //               print("on gallery clicked ");
  //               onGalleryClick();
  //             },
  //             child: Row(
  //               children: [
  //                 const Icon(Icons.browse_gallery),
  //                 const SizedBox(
  //                   width: 10,
  //                 ),
  //                 CustomWidgets.customTextWidget(dataToPrint: "Gallery"),
  //               ],
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  static Future<void> showToast({required BuildContext ctx, String msg = ""}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstants.blue,
        textColor: ColorConstants.color_white,
        fontSize: SizeConstants.FONT_SIZE);
  }

  static Future<void> showGetDialog({required msg}) async {
    return Get.defaultDialog(
        title: "Application",
        middleText: msg,
   //     backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.red),
        confirm: ElevatedButton(
            onPressed: () {
              Get.offAll(Routes.LOGIN);
            },
            child: const Text(
              "Ok",
              style: TextStyle(color: Colors.white),
            )),
        radius: 30);
  }

  static Future<void> showGetMessage({required msg}) async {
    return Get.defaultDialog(
        title: StringConstants.APPLICATIONNAME,
        middleText: msg,
       // backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.red),
        confirm: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Ok",
            
            )),
        radius: 30);
  }

  static Future<void> showMsgDialog({
    required BuildContext ctx,
    String msg = 'Please wait..',
    bool isDismissible = false,
    required Function onOkClick,
  
  }) async {
    return showDialog(
      barrierDismissible: isDismissible,
      context: ctx,
      builder: (ctx) => AlertDialog(
        elevation: 12,
        actions: [
          // Custom_Widgets.customButtonWidget(
          //     btnLbl: "Cancel",
          //     onCustomClick: {print("button clicked..."), onCancelClick()}),
          // Custom_Widgets.customButtonWidget(
          //   btnLbl: "Ok",
          // ),

          ElevatedButton(
              onPressed: () {
                onOkClick();
              },
              child: CustomWidgets.customTextWidget(
                  dataToPrint: "OK",
                  customAlignment: Alignment.center,
                ))
          // ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomWidgets.customTextWidget(
                dataToPrint: "We found...",
                customAlignment: Alignment.center,
                customFontsize: SizeConstants.FONT_SIZE_HEADER),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: ColorConstants.colorDivider),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print("on camera clicked ");
                onOkClick();
              },
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: CustomWidgets.customTextWidget(dataToPrint: msg)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

 static Future<void> showMsgDialog2({
    required BuildContext ctx,
    String msg = 'Please wait..',
    bool isDismissible = false,
    required Function onOkClick,
    required Function onCancelClick,
  
  }) async {
    return showDialog(
      barrierDismissible: isDismissible,
      context: ctx,
      builder: (ctx) => AlertDialog(
        elevation: 12,
        actions: [
       

          ElevatedButton(
              onPressed: () {
                onOkClick();
              },
              child: CustomWidgets.customTextWidget(
                  dataToPrint: "OK",
                  customAlignment: Alignment.center,
                )) , ElevatedButton(
              onPressed: () {
                onCancelClick();
              },
              child: CustomWidgets.customTextWidget(
                  dataToPrint: "Cancel",
                  customAlignment: Alignment.center,
                ))
          // ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomWidgets.customTextWidget(
                dataToPrint: StringConstants.APPLICATIONNAME,
                customAlignment: Alignment.center,
                customFontsize: SizeConstants.FONT_SIZE_HEADER),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: ColorConstants.colorDivider),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print("on camera clicked ");
                onOkClick();
              },
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: CustomWidgets.customTextWidget(dataToPrint: msg)),
                ],
              ),
            ),
          
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
