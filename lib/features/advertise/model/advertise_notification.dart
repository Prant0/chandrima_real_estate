class AdvertiseNotification {
  bool? status;
  Data? data;

  AdvertiseNotification({this.status, this.data});

  AdvertiseNotification.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? adType;
  String? title;
  String? image;
  String? video;
  String? description;

  Data({
    this.id,
    this.adType,
    this.title,
    this.image,
    this.video,
    this.description,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adType = json['ad_type'];
    title = json['title'];
    image = json['image'];
    video = json['video'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ad_type'] = adType;
    data['title'] = title;
    data['image'] = image;
    data['video'] = video;
    data['description'] = description;
    return data;
  }
}
