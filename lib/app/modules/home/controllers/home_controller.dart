import 'package:get/get.dart';
import 'package:therapeutic/app/modules/home/providers/type_provider.dart';
import 'package:therapeutic/app/modules/home/type_model.dart' as typeData;
import 'package:therapeutic/app/modules/models/product_detail_model.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;

class HomeController extends GetxController {
  //TODO: Implement HomeController
// RxMap<String,productModel.Data> ={}.obs;
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

  Future<List<typeData.Data>> getTypeData() {
    return typeProvider!.getType();
  }

  Future<List<productModel.Data>> fetchFoodProducts(String catName,String searchName,
      [int limit = 30]) {
    return typeProvider!.fetchFoodProducts(catName,searchName, limit);
  }

  Future<ProductDetailModel> fetchFoodProductDetail(String id) {
    print("id.... " + id);
    return typeProvider!.fetchFoodProductDetail(id);
  }
}
