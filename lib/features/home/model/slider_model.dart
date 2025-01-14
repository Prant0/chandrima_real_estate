// To parse this JSON data, do
//
//     final slidersModel = slidersModelFromJson(jsonString);

import 'dart:convert';

SlidersModel slidersModelFromJson(String str) => SlidersModel.fromJson(json.decode(str));

String slidersModelToJson(SlidersModel data) => json.encode(data.toJson());

class SlidersModel {
  List<Slider>? sliders;

  SlidersModel({
    this.sliders,
  });

  factory SlidersModel.fromJson(Map<String, dynamic> json) => SlidersModel(
    sliders: json["sliders"] == null ? [] : List<Slider>.from(json["sliders"]!.map((x) => Slider.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sliders": sliders == null ? [] : List<dynamic>.from(sliders!.map((x) => x.toJson())),
  };
}

class Slider {
  int? id;
  String? categoryId;
  String? title;
  String? note;
  String? image;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Slider({
    this.id,
    this.categoryId,
    this.title,
    this.note,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    id: json["id"],
    categoryId: json["category_id"],
    title: json["title"],
    note: json["note"],
    image: json["image"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "title": title,
    "note": note,
    "image": image,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
