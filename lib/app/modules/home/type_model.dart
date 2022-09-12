class Type {
  int? total;
  List<Data>? data;

  Type({this.total, this.data});

  Type.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['total'] = total;
  //   if (data != null) {
  //     data['data'] = data?.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Data {
  String? sId;
  int? total;

  Data({this.sId, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['total'] = total;
    return data;
  }
}
