// To parse this JSON data, do
//
//     final gatePassListModel = gatePassListModelFromJson(jsonString);

import 'dart:convert';

GatePassListModel gatePassListModelFromJson(String str) => GatePassListModel.fromJson(json.decode(str));

String gatePassListModelToJson(GatePassListModel data) => json.encode(data.toJson());

class GatePassListModel {
  bool? status;
  Data? data;

  GatePassListModel({
    this.status,
    this.data,
  });

  factory GatePassListModel.fromJson(Map<String, dynamic> json) => GatePassListModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  List<GatePassData>? data;
  Links? links;
  Meta? meta;

  Data({
    this.data,
    this.links,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<GatePassData>.from(json["data"]!.map((x) => GatePassData.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}

class GatePassData {
  int? id;
  String? gatePassId;
  String? gatepassType;
  String? visitorName;
  String? visitorPhone;
  String? visitorAddress;
  String? visitPurpose;
  DateTime? entryDate;
  DateTime? expiredDate;
  dynamic checkinDate;
  dynamic checkoutDate;
  String? referenceType;
  String? referenceBy;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleModel;
  String? drivingLicense;
  String? paymentMethod;
  String? paymentDetails;
  List<String>? paymentDocuments;
  String? paymentStatus;
  String? note;
  String? status;
  dynamic requestedBy;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? documentPath;

  GatePassData({
    this.id,
    this.gatePassId,
    this.gatepassType,
    this.visitorName,
    this.visitorPhone,
    this.visitorAddress,
    this.visitPurpose,
    this.entryDate,
    this.expiredDate,
    this.checkinDate,
    this.checkoutDate,
    this.referenceType,
    this.referenceBy,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleModel,
    this.drivingLicense,
    this.paymentMethod,
    this.paymentDetails,
    this.paymentDocuments,
    this.paymentStatus,
    this.note,
    this.status,
    this.requestedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.documentPath,
  });

  factory GatePassData.fromJson(Map<String, dynamic> json) => GatePassData(
    id: json["id"],
    gatePassId: json["gate_pass_id"],
    gatepassType: json["gatepass_type"],
    visitorName: json["visitor_name"],
    visitorPhone: json["visitor_phone"],
    visitorAddress: json["visitor_address"],
    visitPurpose: json["visit_purpose"],
    entryDate: json["entry_date"] == null ? null : DateTime.parse(json["entry_date"]),
    expiredDate: json["expired_date"] == null ? null : DateTime.parse(json["expired_date"]),
    checkinDate: json["checkin_date"],
    checkoutDate: json["checkout_date"],
    referenceType: json["reference_type"],
    referenceBy: json["reference_by"],
    vehicleType: json["vehicle_type"],
    vehicleNumber: json["vehicle_number"],
    vehicleModel: json["vehicle_model"],
    drivingLicense: json["driving_license"],
    paymentMethod: json["payment_method"],
    paymentDetails: json["payment_details"],
    paymentDocuments: json["payment_documents"] == null ? [] : List<String>.from(json["payment_documents"]!.map((x) => x)),
    paymentStatus: json["payment_status"],
    note: json["note"],
    status: json["status"],
    requestedBy: json["requested_by"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    documentPath: json["document_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gate_pass_id": gatePassId,
    "gatepass_type": gatepassType,
    "visitor_name": visitorName,
    "visitor_phone": visitorPhone,
    "visitor_address": visitorAddress,
    "visit_purpose": visitPurpose,
    "entry_date": entryDate?.toIso8601String(),
    "expired_date": expiredDate?.toIso8601String(),
    "checkin_date": checkinDate,
    "checkout_date": checkoutDate,
    "reference_type": referenceType,
    "reference_by": referenceBy,
    "vehicle_type": vehicleType,
    "vehicle_number": vehicleNumber,
    "vehicle_model": vehicleModel,
    "driving_license": drivingLicense,
    "payment_method": paymentMethod,
    "payment_details": paymentDetails,
    "payment_documents": paymentDocuments == null ? [] : List<dynamic>.from(paymentDocuments!.map((x) => x)),
    "payment_status": paymentStatus,
    "note": note,
    "status": status,
    "requested_by": requestedBy,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "document_path": documentPath,
  };
}

class Links {
  String? first;
  String? last;
  dynamic prev;
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
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
