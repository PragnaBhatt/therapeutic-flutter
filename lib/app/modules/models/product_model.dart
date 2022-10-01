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
  List<NoteOfUser>? noteOfUser;
  String? id;

  Data(
      {this.sId,
        this.type,
        this.name,
        this.image,
        this.description,
        this.noOfViews,
        this.noteOfUser,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    noOfViews = json['noOfViews'];
    if (json['noteOfUser'] != null) {
      noteOfUser = <NoteOfUser>[];
      json['noteOfUser'].forEach((v) {
        noteOfUser!.add(new NoteOfUser.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['noOfViews'] = this.noOfViews;
    if (this.noteOfUser != null) {
      data['noteOfUser'] = this.noteOfUser!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class NoteOfUser {
  String? sId;
  String? description;
  String? byUser;
  String? forProduct;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  NoteOfUser(
      {this.sId,
        this.description,
        this.byUser,
        this.forProduct,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.id});

  NoteOfUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    byUser = json['byUser'];
    forProduct = json['forProduct'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['byUser'] = this.byUser;
    data['forProduct'] = this.forProduct;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}
