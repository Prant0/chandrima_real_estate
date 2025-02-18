class ComplainModel {
  bool? status;
  Data? data;

  ComplainModel({this.status, this.data});

  ComplainModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<ComplaintCategories>? complaintCategories;
  List<Complaints>? complaints;

  Data({this.complaintCategories, this.complaints});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['complaint_categories'] != null) {
      complaintCategories = <ComplaintCategories>[];
      json['complaint_categories'].forEach((v) {
        complaintCategories!.add(new ComplaintCategories.fromJson(v));
      });
    }
    if (json['complaints'] != null) {
      complaints = <Complaints>[];
      json['complaints'].forEach((v) {
        complaints!.add(new Complaints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.complaintCategories != null) {
      data['complaint_categories'] =
          this.complaintCategories!.map((v) => v.toJson()).toList();
    }
    if (this.complaints != null) {
      data['complaints'] = this.complaints!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ComplaintCategories {
  int? id;
  String? name;

  ComplaintCategories({this.id, this.name});

  ComplaintCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Complaints {
  String? complaintCategory;
  int? id;
  String? title;
  int? complaintCategoryId;
  int? memberId;
  String? description;
  String? document;
  String? date;
  String? status;
  Null? resolution;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  Complaints(
      {this.complaintCategory,
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
        this.updatedAt});

  Complaints.fromJson(Map<String, dynamic> json) {
    complaintCategory = json['complaint_category'];
    id = json['id'];
    title = json['title'];
    complaintCategoryId = json['complaint_category_id'];
    memberId = json['member_id'];
    description = json['description'];
    document = json['document'];
    date = json['date'];
    status = json['status'];
    resolution = json['resolution'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complaint_category'] = this.complaintCategory;
    data['id'] = this.id;
    data['title'] = this.title;
    data['complaint_category_id'] = this.complaintCategoryId;
    data['member_id'] = this.memberId;
    data['description'] = this.description;
    data['document'] = this.document;
    data['date'] = this.date;
    data['status'] = this.status;
    data['resolution'] = this.resolution;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
