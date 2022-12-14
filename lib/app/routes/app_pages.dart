import 'package:get/get.dart';

import '../commons/screens/key_test.dart';
import '../modules/diseases/bindings/diseases_binding.dart';
import '../modules/diseases/views/diseases_food_list_view.dart';
import '../modules/diseases/views/diseases_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/product_details_view.dart';
import '../modules/home/views/product_list_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/signup_screen.dart';
import '../modules/login/views/verify_user_screen.dart';
import '../modules/notes/bindings/notes_binding.dart';
import '../modules/notes/views/notes_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  // static const INITIAL = Routes.VERYFY_USER;
  // static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => ProductListView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => ProductDetailView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.KEY_TEST,
      page: () => KeyTesting(),
    ),
    GetPage(
      name: _Paths.NOTES,
      page: () => const NotesView(),
      binding: NotesBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => SignUp_Screen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERYFY_USER,
      page: () => VerifyUser_Screen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DISEASES,
      page: () => DiseasesView(),
      binding: DiseasesBinding(),
    ),
    GetPage(
      name: _Paths.DISEASES_FOOD,
      page: () => DiseasesFoodListView(),
      binding: DiseasesBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
