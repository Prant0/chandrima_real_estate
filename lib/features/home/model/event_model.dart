// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  String? title;
  String? description;
  DateTime? sendingDate;
  dynamic startDate;
  dynamic endDate;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  EventModel({
    this.title,
    this.description,
    this.sendingDate,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    title: json["title"],
    description: json["description"],
    sendingDate: json["sending_date"] == null ? null : DateTime.parse(json["sending_date"]),
    startDate: json["start_date"],
    endDate: json["end_date"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "sending_date": sendingDate?.toIso8601String(),
    "start_date": startDate,
    "end_date": endDate,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
