// To parse this JSON data, do
//
//     final userInvoiceModel = userInvoiceModelFromJson(jsonString);

import 'dart:convert';

UserInvoiceModel userInvoiceModelFromJson(String str) => UserInvoiceModel.fromJson(json.decode(str));

String userInvoiceModelToJson(UserInvoiceModel data) => json.encode(data.toJson());

class UserInvoiceModel {
  bool? status;
  Data? data;

  UserInvoiceModel({
    this.status,
    this.data,
  });

  factory UserInvoiceModel.fromJson(Map<String, dynamic> json) => UserInvoiceModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  List<UserInvoiceList>? data;
  Links? links;
  Meta? meta;

  Data({
    this.data,
    this.links,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<UserInvoiceList>.from(json["data"]!.map((x) => UserInvoiceList.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}

class UserInvoiceList {
  int? id;
  String? memberId;
  String? invoiceId;
  List<Service>? services;
  dynamic serviceType;
  dynamic discount;
  int? paidAmount;
  int? totalAmount;
  dynamic partialPayment;
  DateTime? paymentDate;
  String? paymentMethod;
  dynamic paymentDetails;
  dynamic paymentDocuments;
  dynamic note;
  String? paymentStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserInvoiceList({
    this.id,
    this.memberId,
    this.invoiceId,
    this.services,
    this.serviceType,
    this.discount,
    this.paidAmount,
    this.totalAmount,
    this.partialPayment,
    this.paymentDate,
    this.paymentMethod,
    this.paymentDetails,
    this.paymentDocuments,
    this.note,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory UserInvoiceList.fromJson(Map<String, dynamic> json) => UserInvoiceList(
    id: json["id"],
    memberId: json["member_id"],
    invoiceId: json["invoice_id"],
    services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
    serviceType: json["service_type"],
    discount: json["discount"],
    paidAmount: json["paid_amount"],
    totalAmount: json["total_amount"],
    partialPayment: json["partial_payment"],
    paymentDate: json["payment_date"] == null ? null : DateTime.parse(json["payment_date"]),
    paymentMethod: json["payment_method"],
    paymentDetails: json["payment_details"],
    paymentDocuments: json["payment_documents"],
    note: json["note"],
    paymentStatus: json["payment_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "member_id": memberId,
    "invoice_id": invoiceId,
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
    "service_type": serviceType,
    "discount": discount,
    "paid_amount": paidAmount,
    "total_amount": totalAmount,
    "partial_payment": partialPayment,
    "payment_date": "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
    "payment_method": paymentMethod,
    "payment_details": paymentDetails,
    "payment_documents": paymentDocuments,
    "note": note,
    "payment_status": paymentStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Service {
  String? serviceName;
  String? serviceCharge;

  Service({
    this.serviceName,
    this.serviceCharge,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    serviceName: json["service_name"],
    serviceCharge: json["service_charge"],
  );

  Map<String, dynamic> toJson() => {
    "service_name": serviceName,
    "service_charge": serviceCharge,
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
