import 'package:get/get.dart';

import '../models/diseases_model.dart' as diseases;
import '../providers/diseases_provider.dart';
import '../models/diseases_food_model.dart' as food;

class DiseasesController extends GetxController {
  //TODO: Implement DiseasesController
  DiseasesProvider? diseasesProvider;
  final count = 0.obs;

  @override
  void onInit() {
    diseasesProvider = new DiseasesProvider();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<diseases.Data>> getDiseases(String id) {
    print("getDiseases.... " + id);
    return diseasesProvider!.getDiseases();
  }

  Future<List<food.Data>> getFoodForDiseases(String name) {
    print("getFoodForDiseases.... " + name);
    return diseasesProvider!.fetchData(name);
  }
}
