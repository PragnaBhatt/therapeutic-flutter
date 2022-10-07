class DiseasesFoodModel {
  List<Data>? data;

  DiseasesFoodModel({this.data});

  DiseasesFoodModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? diseases;
  String? food;
  String? image;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
        this.diseases,
        this.food,
        this.image,
        this.iV,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    diseases = json['diseases'];
    food = json['food'];
    image = json['image'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['diseases'] = this.diseases;
    data['food'] = this.food;
    data['image'] = this.image;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
