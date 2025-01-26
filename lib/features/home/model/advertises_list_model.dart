class AdvertisesListModel {
  bool? status;
  List<Advertises>? data;

  AdvertisesListModel({this.status, this.data});

  AdvertisesListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Advertises>[];
      json['data'].forEach((v) {
        data!.add(Advertises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Advertises {
  int? id;
  String? title;
  String? image;
  String? description;

  Advertises({this.id, this.title, this.image, this.description});

  Advertises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}
