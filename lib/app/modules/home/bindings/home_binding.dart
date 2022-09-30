import 'package:get/get.dart';
import 'package:therapeutic/app/modules/notes/controllers/notes_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    ); Get.lazyPut<NotesController>(
      () => NotesController(),
    );
  }
}
