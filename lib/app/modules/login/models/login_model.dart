class LoginModel {
  int? status;
  String? message;
  User? user;

  LoginModel({this.status, this.message, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? oTP;
  String? photo;
  String? email;
  String? userRole;
  bool? isActive;
  bool? isVerified;
  List<Tokens>? tokens;

  User({
    this.sId,
    this.name,
    this.oTP,
    this.photo,
    this.email,
    this.userRole,
    this.isActive,
    this.isVerified,
    this.tokens,
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    oTP = json['OTP'];
    photo = json['photo'];
    email = json['email'];
    userRole = json['userRole'];
    isActive = json['isActive'];
    isVerified = json['isVerified'];
    if (json['tokens'] != null) {
      tokens = <Tokens>[];
      json['tokens'].forEach((v) {
        tokens!.add(new Tokens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['OTP'] = this.oTP;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['userRole'] = this.userRole;
    data['isActive'] = this.isActive;
    data['isVerified'] = this.isVerified;
    if (this.tokens != null) {
      data['tokens'] = this.tokens!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Tokens {
  String? token;
  String? sId;

  Tokens({this.token, this.sId});

  Tokens.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['_id'] = this.sId;
    return data;
  }
}
