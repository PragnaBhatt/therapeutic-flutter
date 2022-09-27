class ProductModel {
  int? total;
  List<Data>? data;

  ProductModel({this.total, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  int? noOfViews;

  Data(
      {this.sId,
        this.type,
        this.name,
        this.image,
        this.description,
        this.noOfViews});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    noOfViews = json['noOfViews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['noOfViews'] = this.noOfViews;
    return data;
  }
}
