

class NotificationModel {
  String? type;
  String? itemId;
  String? notify,date;
  int? read;
  DateTime? createdAt;
  String? link;

  NotificationModel({
    this.type,
    this.itemId,
    this.notify,
    this.read,
    this.createdAt,
    this.date,
    this.link
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    type: json["type"],
    itemId: json["item_id"],
    notify: json["notify"],
    read: json["read"],
    date: json["date"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    link: json["link"]
  );


}

class Links {
  String? first;
  dynamic last;
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
