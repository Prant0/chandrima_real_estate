// To parse this JSON data, do
//
//     final advertisesListModel = advertisesListModelFromJson(jsonString);

import 'dart:convert';

AdvertisesListModel advertisesListModelFromJson(String str) => AdvertisesListModel.fromJson(json.decode(str));

String advertisesListModelToJson(AdvertisesListModel data) => json.encode(data.toJson());

class AdvertisesListModel {
  bool? status;
  List<Advertises>? data;

  AdvertisesListModel({
    this.status,
    this.data,
  });

  factory AdvertisesListModel.fromJson(Map<String, dynamic> json) => AdvertisesListModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Advertises>.from(json["data"]!.map((x) => Advertises.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Advertises {
  int? id;
  String? adType;
  String? title;
  String? image;
  String? video;
  String? description;

  Advertises({
    this.id,
    this.adType,
    this.title,
    this.image,
    this.video,
    this.description,
  });

  factory Advertises.fromJson(Map<String, dynamic> json) => Advertises(
    id: json["id"],
    adType: json["ad_type"],
    title: json["title"],
    image: json["image"],
    video: json["video"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ad_type": adType,
    "title": title,
    "image": image,
    "video": video,
    "description": description,
  };
}
