import 'dart:convert';

AdvertiseSettingsModel advertiseSettingsModelFromJson(String str) =>
    AdvertiseSettingsModel.fromJson(json.decode(str));

String advertiseSettingsModelToJson(AdvertiseSettingsModel data) =>
    json.encode(data.toJson());

class AdvertiseSettingsModel {
  bool? status;
  String? perdayPrice;

  AdvertiseSettingsModel({
    this.status,
    this.perdayPrice,
  });

  factory AdvertiseSettingsModel.fromJson(Map<String, dynamic> json) =>
      AdvertiseSettingsModel(
        status: json["status"],
        perdayPrice: json["perday_price"],
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "perday_price": perdayPrice,
      };
}
