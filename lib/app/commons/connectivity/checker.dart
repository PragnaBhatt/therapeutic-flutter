import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class Checker extends GetxController {
  ConnectivityResult? _connectivityResult;
  late StreamSubscription _connectivitySubscription;
  bool? _isConnectionSuccessful;
  RxBool isConnectedToInternet = false.obs;
  @override
  // TODO: implement initialized
  void onInit() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    _connectivityResult = result;
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print('Current connectivity status:????: $result');

      _connectivityResult = result;

      if (result == ConnectivityResult.wifi) {
        print('Connected to a Wi-Fi network');
          isConnectedToInternet.value = true;
      } else if (result == ConnectivityResult.mobile) {
        print('Connected to a mobile network');
          isConnectedToInternet.value = true;
      } else {
        print('Not connected to any network');
        isConnectedToInternet.value = false;
      }
    });
    super.onInit();
  }

  // Future<void> _checkConnectivityState() async {
  //   final ConnectivityResult result = await Connectivity().checkConnectivity();

  //   if (result == ConnectivityResult.wifi) {
  //     print('Connected to a Wi-Fi network');
  //   } else if (result == ConnectivityResult.mobile) {
  //     print('Connected to a mobile network');
  //   } else {
  //     print('Not connected to any network');
  //   }

  //   _connectivityResult = result;
  // }
}
