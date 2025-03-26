

class ComplaintCategoryModel {
  bool? status;
  List<ComplaintCategory>? data;

  ComplaintCategoryModel({
    this.status,
    this.data,
  });

  factory ComplaintCategoryModel.fromJson(Map<String, dynamic> json) => ComplaintCategoryModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ComplaintCategory>.from(json["data"]!.map((x) => ComplaintCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ComplaintCategory {
  int? id;
  String? name;

  ComplaintCategory({
    this.id,
    this.name,
  });

  factory ComplaintCategory.fromJson(Map<String, dynamic> json) => ComplaintCategory(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
