

import 'dart:convert';

TenantModel tenantModelFromJson(String str) => TenantModel.fromJson(json.decode(str));

String tenantModelToJson(TenantModel data) => json.encode(data.toJson());

class TenantModel {
  int? id;
  String? tenantId;
  String? memberId;
  String? name;
  String? mobile;
  dynamic email;
  String? photo;
  String? gender;
  dynamic birthday;
  dynamic houseNumber;
  dynamic flatNo;
  dynamic advanceRent;
  dynamic rentPerMonth;
  dynamic rentMonth;
  dynamic rentYear;
  dynamic nidNumber;
  List<String>? nidImage;
  dynamic refDetails;
  dynamic previousAddress;
  dynamic permanentAddress;
  List<Document>? documents;
  String? idCardReason;
  String? idCardStatus;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  TenantModel({
    this.id,
    this.tenantId,
    this.memberId,
    this.name,
    this.mobile,
    this.email,
    this.photo,
    this.gender,
    this.birthday,
    this.houseNumber,
    this.flatNo,
    this.advanceRent,
    this.rentPerMonth,
    this.rentMonth,
    this.rentYear,
    this.nidNumber,
    this.nidImage,
    this.refDetails,
    this.previousAddress,
    this.permanentAddress,
    this.documents,
    this.idCardReason,
    this.idCardStatus,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) => TenantModel(
    id: json["id"],
    tenantId: json["tenant_id"],
    memberId: json["member_id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    photo: json["photo"],
    gender: json["gender"],
    birthday: json["birthday"],
    houseNumber: json["house_number"],
    flatNo: json["flat_no"],
    advanceRent: json["advance_rent"],
    rentPerMonth: json["rent_per_month"],
    rentMonth: json["rent_month"],
    rentYear: json["rent_year"],
    nidNumber: json["nid_number"],
    nidImage: json["nid_image"] == null ? [] : List<String>.from(json["nid_image"]!.map((x) => x)),
    refDetails: json["ref_details"],
    previousAddress: json["previous_address"],
    permanentAddress: json["permanent_address"],
    documents: json["documents"] == null ? [] : List<Document>.from(json["documents"]!.map((x) => Document.fromJson(x))),
    idCardReason: json["id_card_reason"],
    idCardStatus: json["id_card_status"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tenant_id": tenantId,
    "member_id": memberId,
    "name": name,
    "mobile": mobile,
    "email": email,
    "photo": photo,
    "gender": gender,
    "birthday": birthday,
    "house_number": houseNumber,
    "flat_no": flatNo,
    "advance_rent": advanceRent,
    "rent_per_month": rentPerMonth,
    "rent_month": rentMonth,
    "rent_year": rentYear,
    "nid_number": nidNumber,
    "nid_image": nidImage == null ? [] : List<dynamic>.from(nidImage!.map((x) => x)),
    "ref_details": refDetails,
    "previous_address": previousAddress,
    "permanent_address": permanentAddress,
    "documents": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x.toJson())),
    "id_card_reason": idCardReason,
    "id_card_status": idCardStatus,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Document {
  String? documentTitle;
  List<String>? documentFile;
  String? documentPath;

  Document({
    this.documentTitle,
    this.documentFile,
    this.documentPath,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    documentTitle: json["document_title"],
    documentFile: json["document_file"] == null ? [] : List<String>.from(json["document_file"]!.map((x) => x)),
    documentPath: json["document_path"],
  );

  Map<String, dynamic> toJson() => {
    "document_title": documentTitle,
    "document_file": documentFile == null ? [] : List<dynamic>.from(documentFile!.map((x) => x)),
    "document_path": documentPath,
  };
}
