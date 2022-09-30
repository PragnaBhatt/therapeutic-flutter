class NoteModel {
  int? status;
  String? message;
  Note? note;

  NoteModel({this.status, this.message, this.note});

  NoteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    note = json['Note'] != null ? new Note.fromJson(json['Note']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.note != null) {
      data['Note'] = this.note!.toJson();
    }
    return data;
  }
}

class Note {
  String? sId;
  String? description;
  ByUser? byUser;
  ForProduct? forProduct;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Note(
      {this.sId,
        this.description,
        this.byUser,
        this.forProduct,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Note.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    byUser =
    json['byUser'] != null ? new ByUser.fromJson(json['byUser']) : null;
    forProduct = json['forProduct'] != null
        ? new ForProduct.fromJson(json['forProduct'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    if (this.byUser != null) {
      data['byUser'] = this.byUser!.toJson();
    }
    if (this.forProduct != null) {
      data['forProduct'] = this.forProduct!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ByUser {
  String? sId;
  String? name;
  String? photo;

  ByUser({this.sId, this.name, this.photo});

  ByUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}

class ForProduct {
  String? sId;
  String? type;
  String? name;
  String? image;
  int? noOfViews;

  ForProduct({this.sId, this.type, this.name, this.image, this.noOfViews});

  ForProduct.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    noOfViews = json['noOfViews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['image'] = this.image;
    data['noOfViews'] = this.noOfViews;
    return data;
  }
}
