// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int? id;
  String? categoryId;
  String? subCategoryId;
  String? chSubCategoryId;
  int? brandId;
  int? unitId;
  String? name;
  String? slug;
  String? code;
  dynamic model;
  String? origin;
  dynamic weight;
  dynamic serialImei;
  String? shortDescription;
  String? longDescription;
  String? mainImage;
  String? bigImage;
  dynamic upComImage;
  dynamic videoUrl;
  int? discount;
  int? sellPrice;
  int? regularPrice;
  int? sellQty;
  int? sellCount;
  int? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;
  Category? subCategory;
  Brand? brand;

  ProductModel({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.chSubCategoryId,
    this.brandId,
    this.unitId,
    this.name,
    this.slug,
    this.code,
    this.model,
    this.origin,
    this.weight,
    this.serialImei,
    this.shortDescription,
    this.longDescription,
    this.mainImage,
    this.bigImage,
    this.upComImage,
    this.videoUrl,
    this.discount,
    this.sellPrice,
    this.regularPrice,
    this.sellQty,
    this.sellCount,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.subCategory,
    this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    chSubCategoryId: json["ch_sub_category_id"],
    brandId: json["brand_id"],
    unitId: json["unit_id"],
    name: json["name"],
    slug: json["slug"],
    code: json["code"],
    model: json["model"],
    origin: json["origin"],
    weight: json["weight"],
    serialImei: json["serial_imei"],
    shortDescription: json["short_description"],
    longDescription: json["long_description"],
    mainImage: json["main_image"],
    bigImage: json["big_image"],
    upComImage: json["up_com_image"],
    videoUrl: json["video_url"],
    discount: json["discount"],
    sellPrice: json["sell_price"],
    regularPrice: json["regular_price"],
    sellQty: json["sell_qty"],
    sellCount: json["sell_count"],
    status: json["status"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subCategory: json["sub_category"] == null ? null : Category.fromJson(json["sub_category"]),
    brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "ch_sub_category_id": chSubCategoryId,
    "brand_id": brandId,
    "unit_id": unitId,
    "name": name,
    "slug": slug,
    "code": code,
    "model": model,
    "origin": origin,
    "weight": weight,
    "serial_imei": serialImei,
    "short_description": shortDescription,
    "long_description": longDescription,
    "main_image": mainImage,
    "big_image": bigImage,
    "up_com_image": upComImage,
    "video_url": videoUrl,
    "discount": discount,
    "sell_price": sellPrice,
    "regular_price": regularPrice,
    "sell_qty": sellQty,
    "sell_count": sellCount,
    "status": status,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "category": category?.toJson(),
    "sub_category": subCategory?.toJson(),
    "brand": brand?.toJson(),
  };
}

class Brand {
  int? id;
  String? categoryId;
  String? name;
  String? slug;
  String? image;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Brand({
    this.id,
    this.categoryId,
    this.name,
    this.slug,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "slug": slug,
    "image": image,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? note;
  String? image;
  String? catCode;
  String? catLevel;
  String? serial;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.note,
    this.image,
    this.catCode,
    this.catLevel,
    this.serial,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    note: json["note"],
    image: json["image"],
    catCode: json["cat_code"],
    catLevel: json["cat_level"],
    serial: json["serial"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "note": note,
    "image": image,
    "cat_code": catCode,
    "cat_level": catLevel,
    "serial": serial,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
