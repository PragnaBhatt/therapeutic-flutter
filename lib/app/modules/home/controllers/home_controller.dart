import 'package:get/get.dart';
import 'package:therapeutic/app/modules/home/providers/type_provider.dart';
import 'package:therapeutic/app/modules/home/type_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  TypeProvider? typeProvider;
  @override
  void onInit() {
    typeProvider = TypeProvider();

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

  void increment() => count.value++;
  Future<List<Type>> getTypeData() {
   return  typeProvider!.getType();
  }
}
