// To parse this JSON data, do
//
//     final complainModel = complainModelFromJson(jsonString);

import 'dart:convert';

ComplainModel complainModelFromJson(String str) => ComplainModel.fromJson(json.decode(str));

String complainModelToJson(ComplainModel data) => json.encode(data.toJson());

class ComplainModel {
  bool? status;
  Data? data;

  ComplainModel({
    this.status,
    this.data,
  });

  factory ComplainModel.fromJson(Map<String, dynamic> json) => ComplainModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  List<Complaint>? complaints;
  List<ComplaintCategory>? complaintCategories;

  Data({
    this.complaints,
    this.complaintCategories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    complaints: json["complaints"] == null ? [] : List<Complaint>.from(json["complaints"]!.map((x) => Complaint.fromJson(x))),
    complaintCategories: json["complaint_categories"] == null ? [] : List<ComplaintCategory>.from(json["complaint_categories"]!.map((x) => ComplaintCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "complaints": complaints == null ? [] : List<dynamic>.from(complaints!.map((x) => x.toJson())),
    "complaint_categories": complaintCategories == null ? [] : List<dynamic>.from(complaintCategories!.map((x) => x.toJson())),
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

class Complaint {
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

  Complaint({
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

  factory Complaint.fromJson(Map<String, dynamic> json) => Complaint(
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

  Map<String, dynamic> toJson() => {
    "complaint_category": complaintCategory,
    "id": id,
    "title": title,
    "complaint_category_id": complaintCategoryId,
    "member_id": memberId,
    "description": description,
    "document": document == null ? [] : List<dynamic>.from(document!.map((x) => x)),
    "date": date?.toIso8601String(),
    "status": status,
    "resolution": resolution,
    "created_by": createdBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "document_path": documentPath,
  };
}
