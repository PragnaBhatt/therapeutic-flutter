import 'dart:convert';

import 'package:get/get.dart';

import '../../../commons/utils/dialogs.dart';
import '../../../config/config.dart';

import 'package:http/http.dart' as http;

import '../models/diseases_food_model.dart' as food;
import '../models/diseases_model.dart' as diseases;

class DiseasesProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return type.fromJson(map);
    //   if (map is List) return map.map((item) => TypeModel.fromJson(item)).toList();
    // };
    // httpClient.baseUrl = 'http://192.168.30.222:5000/food/fetchFoodTypes';
    //httpClient.baseUrl = Config.baseUrl+'fetchFoodTypes';
  }

  Future<List<diseases.Data>> getDiseases() async {
    final response = await get(Config.baseUrl + 'food/diseases/fetch');
    if (response.statusCode == 200) {
      print("getType response.... ${response.body}");
      return (response.body["data"] as List)
          .map((e) => diseases.Data.fromJson(e))
          .toList();
    } else {
      print("getDiseases response  not found ");
      throw new Exception(response.toString());
    }
  }

  Future<List<food.Data>> fetchData(String name) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request =
        http.Request('GET', Uri.parse(Config.baseUrl + 'food/diseases/fetchData'));
    request.bodyFields = {'diseases': name};
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      food.DiseasesFoodModel model = new food.DiseasesFoodModel();
      model = food.DiseasesFoodModel.fromJson(json.decode(res.toString()));
      return model.data!;
    } else {
      print("in to else... fetchFoodProductDetail");
      throw new Exception();
    }
  }
}
