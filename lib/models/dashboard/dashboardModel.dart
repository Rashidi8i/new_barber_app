// ignore_for_file: file_names, camel_case_types

class dashboardModel {
  List<Data>? data;

  dashboardModel({this.data});

  dashboardModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? isHotel;
  String? totalAmount;
  String? city;
  String? longitude;
  String? latitude;
  List<String>? allImages;

  Data(
      {this.id,
      this.name,
      this.isHotel,
      this.totalAmount,
      this.city,
      this.longitude,
      this.latitude,
      this.allImages});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isHotel = json['is_hotel'];
    totalAmount = json['total_amount'];
    city = json['city'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    allImages = json['all_images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_hotel'] = isHotel;
    data['total_amount'] = totalAmount;
    data['city'] = city;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['all_images'] = allImages;
    return data;
  }
}
