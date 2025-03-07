// To parse this JSON data, do
//
//     final gatePassTypeModel = gatePassTypeModelFromJson(jsonString);

import 'dart:convert';

GatePassTypeModel gatePassTypeModelFromJson(String str) => GatePassTypeModel.fromJson(json.decode(str));

String gatePassTypeModelToJson(GatePassTypeModel data) => json.encode(data.toJson());

class GatePassTypeModel {
  bool? status;
  Data? data;

  GatePassTypeModel({
    this.status,
    this.data,
  });

  factory GatePassTypeModel.fromJson(Map<String, dynamic> json) => GatePassTypeModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  List<GatepassType>? gatepassTypes;
  List<VehicleType>? vehicleTypes;
  GetPaymentMethods? getPaymentMethods;

  Data({
    this.gatepassTypes,
    this.vehicleTypes,
    this.getPaymentMethods,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    gatepassTypes: json["gatepass_types"] == null ? [] : List<GatepassType>.from(json["gatepass_types"]!.map((x) => GatepassType.fromJson(x))),
    vehicleTypes: json["vehicle_types"] == null ? [] : List<VehicleType>.from(json["vehicle_types"]!.map((x) => VehicleType.fromJson(x))),
    getPaymentMethods: json["get_payment_methods"] == null ? null : GetPaymentMethods.fromJson(json["get_payment_methods"]),
  );

  Map<String, dynamic> toJson() => {
    "gatepass_types": gatepassTypes == null ? [] : List<dynamic>.from(gatepassTypes!.map((x) => x.toJson())),
    "vehicle_types": vehicleTypes == null ? [] : List<dynamic>.from(vehicleTypes!.map((x) => x.toJson())),
    "get_payment_methods": getPaymentMethods?.toJson(),
  };
}

class GatepassType {
  String? name;
  String? slug;
  String? icon;
  String? paymentType;
  int? autoApprove;
  List<String>? visitPurpose;

  GatepassType({
    this.name,
    this.slug,
    this.icon,
    this.paymentType,
    this.autoApprove,
    this.visitPurpose,
  });

  factory GatepassType.fromJson(Map<String, dynamic> json) => GatepassType(
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    paymentType: json["payment_type"],
    autoApprove: json["auto_approve"],
    visitPurpose: json["visit_purpose"] == null ? [] : List<String>.from(json["visit_purpose"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
    "icon": icon,
    "payment_type": paymentType,
    "auto_approve": autoApprove,
    "visit_purpose": visitPurpose == null ? [] : List<dynamic>.from(visitPurpose!.map((x) => x)),
  };
}

class GetPaymentMethods {
  String? cash;
  String? bank;
  String? cheque;
  String? others;

  GetPaymentMethods({
    this.cash,
    this.bank,
    this.cheque,
    this.others,
  });

  factory GetPaymentMethods.fromJson(Map<String, dynamic> json) => GetPaymentMethods(
    cash: json["cash"],
    bank: json["bank"],
    cheque: json["cheque"],
    others: json["others"],
  );

  Map<String, dynamic> toJson() => {
    "cash": cash,
    "bank": bank,
    "cheque": cheque,
    "others": others,
  };
}

class VehicleType {
  String? vehicleFor;
  String? name;
  int? price;

  VehicleType({
    this.vehicleFor,
    this.name,
    this.price,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
    vehicleFor: json["vehicle_for"],
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle_for": vehicleFor,
    "name": name,
    "price": price,
  };
}
