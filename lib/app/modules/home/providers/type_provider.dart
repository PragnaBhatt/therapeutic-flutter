import 'dart:convert';

import 'package:get/get.dart';

import '../type_model.dart' as typeData;

class TypeProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return type.fromJson(map);
    //   if (map is List) return map.map((item) => TypeModel.fromJson(item)).toList();
    // };
    httpClient.baseUrl = 'http://192.168.30.222:5000/food/fetchFoodTypes';
  }

  Future<List<typeData.Data>> getType() async {
    final response =
        await get('http://192.168.30.222:5000/food/fetchFoodTypes');
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
}
