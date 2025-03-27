

class MyAdvertiseModel {
  int? id;
  String? adType;
  String? title;
  String? image;
  dynamic video;
  String? description;
  String? status;
  DateTime? createdAt;

  MyAdvertiseModel({
    this.id,
    this.adType,
    this.title,
    this.image,
    this.video,
    this.description,
    this.status,
    this.createdAt,
  });

  factory MyAdvertiseModel.fromJson(Map<String, dynamic> json) => MyAdvertiseModel(
    id: json["id"],
    adType: json["ad_type"],
    title: json["title"],
    image: json["image"],
    video: json["video"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

}
