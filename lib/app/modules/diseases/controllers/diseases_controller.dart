import 'package:get/get.dart';

import '../models/diseases_model.dart' as diseases;
import '../providers/diseases_provider.dart';
import '../models/diseases_food_model.dart' as food;

class DiseasesController extends GetxController {
  //TODO: Implement DiseasesController
  DiseasesProvider? diseasesProvider;
  final count = 0.obs;
  List<diseases.Data> list = [];
  RxList<diseases.Data> filteredList = RxList();

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
    return diseasesProvider!
        .getDiseases()
        .then((value) => filteredList.value = list = value);
  }

  List<diseases.Data> diseasesList(String search) {
    if (search.isEmpty) {
      return filteredList.value = list;
    } else {
      filteredList=RxList();
      for (int i = 0; i < list.length; i++) {
        print("list...${list[i].name} ");
        if (list[i].name!.toLowerCase().contains(search.toLowerCase()) == 0) {
          filteredList.add(list[i]);
        }
      }
      print("size.... ${filteredList.length}");
     /* print(
          "data.... length $search ${list.where((element) => element.name!.contains("Warts") == 1).toList().length}");
      print("LIST....${list.length}");
      return list
          .where((element) => element.name!.contains("Warts") == 1)
          .toList();*/
      return filteredList;
    }
  }

  Future<List<food.Data>> getFoodForDiseases(String name) {
    print("getFoodForDiseases.... " + name);
    return diseasesProvider!.fetchData(name);
  }
}
