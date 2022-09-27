class SignupModel {
  int? status;
  String? message;
  Data? data;

  SignupModel({this.status, this.message, this.data});

  SignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Detail? detail;
  String? token;

  Data({this.detail, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    detail =
        json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Detail {
  String? userName;
  String? email;
  String? photoURL;
  bool? isVerified;
  String? oTP;
  bool? isActive;
  String? sId;

  String? createdAt;
  String? updatedAt;

  Detail(
      {this.userName,
      this.email,
      this.photoURL,
      this.isVerified,
      this.oTP,
      this.isActive,
      this.sId,
      this.createdAt,
      this.updatedAt});

  Detail.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    photoURL = json['photoURL'];
    isVerified = json['isVerified'];
    oTP = json['OTP'];
    isActive = json['isActive'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['photoURL'] = this.photoURL;
    data['isVerified'] = this.isVerified;
    data['OTP'] = this.oTP;
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;

    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
