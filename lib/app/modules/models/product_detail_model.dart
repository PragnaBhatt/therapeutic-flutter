class ProductDetailModel {
  Data? data;

  ProductDetailModel({this.data});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? type;
  String? name;
  String? image;
  String? description;
  String? nutritionalBenefits;
  String? healthBenefits;
  String? consumptionTips;
  String? caution;
  int? iV;
  String? createdAt;
  String? updatedAt;
  String? inc;
  int? noOfViews;

  Data(
      {this.sId,
        this.type,
        this.name,
        this.image,
        this.description,
        this.nutritionalBenefits,
        this.healthBenefits,
        this.consumptionTips,
        this.caution,
        this.iV,
        this.createdAt,
        this.updatedAt,
        this.inc,
        this.noOfViews});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    nutritionalBenefits = json['NutritionalBenefits'];
    healthBenefits = json['HealthBenefits'];
    consumptionTips = json['ConsumptionTips'];
    caution = json['Caution'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    inc = json['inc'];
    noOfViews = json['noOfViews'];
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
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['inc'] = this.inc;
    data['noOfViews'] = this.noOfViews;
    return data;
  }
}
