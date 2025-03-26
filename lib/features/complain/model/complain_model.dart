// To parse this JSON data, do
//
//     final complainModel = complainModelFromJson(jsonString);


class Complaints {
  List<ComplainModelList>? data;
  Links? links;
  Meta? meta;

  Complaints({
    this.data,
    this.links,
    this.meta,
  });

  factory Complaints.fromJson(Map<String, dynamic> json) => Complaints(
    data: json["data"] == null ? [] : List<ComplainModelList>.from(json["data"]!.map((x) => ComplainModelList.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

}

class ComplainModelList {
  String? complaintCategory;
  int? id;
  String? title;
  int? complaintCategoryId;
  int? memberId;
  String? description;
  List<String>? document;
  DateTime? date;
  String? status;
  String? resolution;
  dynamic createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? documentPath;

  ComplainModelList({
    this.complaintCategory,
    this.id,
    this.title,
    this.complaintCategoryId,
    this.memberId,
    this.description,
    this.document,
    this.date,
    this.status,
    this.resolution,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.documentPath,
  });

  factory ComplainModelList.fromJson(Map<String, dynamic> json) => ComplainModelList(
    complaintCategory: json["complaint_category"],
    id: json["id"],
    title: json["title"],
    complaintCategoryId: json["complaint_category_id"],
    memberId: json["member_id"],
    description: json["description"],
    document: json["document"] == null ? [] : List<String>.from(json["document"]!.map((x) => x)),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    status: json["status"],
    resolution: json["resolution"],
    createdBy: json["created_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    documentPath: json["document_path"],
  );


}

class Links {
  String? first;
  dynamic last;
  String? prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  int? currentPage;
  int? from;
  String? path;
  int? perPage;
  int? to;

  Meta({
    this.currentPage,
    this.from,
    this.path,
    this.perPage,
    this.to,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "path": path,
    "per_page": perPage,
    "to": to,
  };
}
