import 'package:get/get.dart';
import 'package:therapeutic/app/modules/home/views/product_details_view.dart';
import 'package:therapeutic/app/modules/home/views/product_list_view.dart';

import '../commons/screens/key_test.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.LOGIN;
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () =>  ProductListView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () =>  ProductDetailView(),
      binding: HomeBinding(),
    ), GetPage(
      name: _Paths.KEY_TEST,
      page: () =>  KeyTesting(),

    ),

  ];
}
