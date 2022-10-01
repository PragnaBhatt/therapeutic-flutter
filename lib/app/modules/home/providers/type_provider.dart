import 'dart:convert';

import 'package:get/get.dart';
import 'package:therapeutic/app/modules/models/product_detail_model.dart';

import '../../../config/config.dart';
import '../type_model.dart' as typeData;
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;
import 'package:http/http.dart' as http;

class TypeProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return type.fromJson(map);
    //   if (map is List) return map.map((item) => TypeModel.fromJson(item)).toList();
    // };
    // httpClient.baseUrl = 'http://192.168.30.222:5000/food/fetchFoodTypes';
    //httpClient.baseUrl = Config.baseUrl+'fetchFoodTypes';
  }

  Future<List<typeData.Data>> getType() async {
    final response = await get(Config.baseUrl + 'food/fetchFoodTypes');
    if (response.statusCode == 200) {
      print("getType response.... ${response.body}");
      return (response.body["data"] as List)
          .map((e) => typeData.Data.fromJson(e))
          .toList();
    } else {
      print("getType response  not found");
      throw new Exception();
    }
  }

  Future<List<productModel.Data>> fetchFoodProducts(String catName,int limit) async {
    /*final response =
        await get('http://192.168.30.222:5000/food/fetchFoodProducts',);
    if (response.statusCode == 200) {
      print("fetchFoodProducts response.... ${response.body}");
      return (response.body["data"] as List)
          .map((e) => productModel.Data.fromJson(e))
          .toList();
    } else {
      print("fetchFoodProducts response  not found");
      throw new Exception();
    }*/

  //  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var headers = {'Authorization': Config.token};
    var request = http.Request(
        'GET', Uri.parse(Config.baseUrl + 'food/fetchFoodProducts'));
    if(catName.isNotEmpty) {
      request.bodyFields = {'type': catName};
    }
    else{
      request.bodyFields = {'limit': '10'};
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();
    print("RESSS ${res}");
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());

      try {
        productModel.ProductModel model = new productModel.ProductModel();
        model = productModel.ProductModel.fromJson(json.decode(res.toString()));
        return model.data!;
      }catch(e)
    {
      print("in to else11fetch product ${e.toString()}");
      throw new Exception(e);
    }

    } else {
      print("in to else11111****...");
      throw new Exception();
    }
  }

  Future<ProductDetailModel> fetchFoodProductDetail(String prodId) async {

    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'GET', Uri.parse(Config.baseUrl + 'food/fetchFoodProducts'));
    request.bodyFields = {'id': prodId};
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    updateTimeFoodProducts(prodId);
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      ProductDetailModel model = new ProductDetailModel();
      model = ProductDetailModel.fromJson(json.decode(res.toString()));
      return model;
    } else {
      print("in to else... fetchFoodProductDetail");
      throw new Exception();
    }
  }

  updateTimeFoodProducts(String prodId) async {
    print("updateTimeFoodProducts.....");
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'PUT', Uri.parse(Config.baseUrl + 'food/updateTimeFoodProducts'));
    request.bodyFields = {'id': prodId};
    request.headers.addAll(headers);

    await request.send();
  }
}
