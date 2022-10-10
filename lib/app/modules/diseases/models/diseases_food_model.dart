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
  List<Results>? results;

  Data(
      {this.sId,
      this.diseases,
      this.food,
      this.image,
      this.iV,
      this.createdAt,
      this.updatedAt,
      this.results});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    diseases = json['diseases'];
    food = json['food'];
    image = json['image'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
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
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? sId;
  String? type;
  String? name;
  String? image;
  String? description;
  String? nutritionalBenefits;
  String? healthBenefits;
  String? consumptionTips;
  String? caution;
  int? noOfViews;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.sId,
      this.type,
      this.name,
      this.image,
      this.description,
      this.nutritionalBenefits,
      this.healthBenefits,
      this.consumptionTips,
      this.caution,
      this.noOfViews,
      this.iV,
      this.createdAt,
      this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    nutritionalBenefits = json['NutritionalBenefits'];
    healthBenefits = json['HealthBenefits'];
    consumptionTips = json['ConsumptionTips'];
    caution = json['Caution'];
    noOfViews = json['noOfViews'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['NutritionalBenefits'] = this.nutritionalBenefits;
    data['HealthBenefits'] = this.healthBenefits;
    data['ConsumptionTips'] = this.consumptionTips;
    data['Caution'] = this.caution;
    data['noOfViews'] = this.noOfViews;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
