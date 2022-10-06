class UserRegisterModel {
  int? status;
  String? message;
  User? user;

  UserRegisterModel({this.status, this.message, this.user});

  UserRegisterModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? oTP;
  String? photo;
  String? email;
  String? userRole;
  bool? isActive;
  bool? isVerified;
  String? sId;


  User(
      {this.name,
        this.oTP,
        this.photo,
        this.email,
        this.userRole,
        this.isActive,
        this.isVerified,
        this.sId
       });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    oTP = json['OTP'];
    photo = json['photo'];
    email = json['email'];
    userRole = json['userRole'];
    isActive = json['isActive'];
    isVerified = json['isVerified'];
    sId = json['_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['OTP'] = this.oTP;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['userRole'] = this.userRole;
    data['isActive'] = this.isActive;
    data['isVerified'] = this.isVerified;
    data['_id'] = this.sId;

    return data;
  }
}
