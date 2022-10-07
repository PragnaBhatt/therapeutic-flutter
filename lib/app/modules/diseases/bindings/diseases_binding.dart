import 'package:get/get.dart';

import '../controllers/diseases_controller.dart';

class DiseasesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseasesController>(
      () => DiseasesController(),
    );
  }
}
