// To parse this JSON data, do
//
//     final categoryProductsModel = categoryProductsModelFromJson(jsonString);

import 'dart:convert';

CategoryProductsModel categoryProductsModelFromJson(String str) => CategoryProductsModel.fromJson(json.decode(str));

String categoryProductsModelToJson(CategoryProductsModel data) => json.encode(data.toJson());

class CategoryProductsModel {
  String? status;
  List<Product>? products;

  CategoryProductsModel({
    this.status,
    this.products,
  });

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) => CategoryProductsModel(
    status: json["status"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
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

  Product({
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
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
  };
}

class Category {
  int? id;
  Name? name;
  Slug? slug;
  Icon? icon;
  Note? note;
  Image? image;
  String? catCode;
  CatLevel? catLevel;
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
    name: nameValues.map[json["name"]],
    slug: slugValues.map[json["slug"]],
    icon: iconValues.map[json["icon"]],
    note: noteValues.map[json["note"]],
    image: imageValues.map[json["image"]],
    catCode: json["cat_code"],
    catLevel: catLevelValues.map[json["cat_level"]],
    serial: json["serial"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "slug": slugValues.reverse[slug],
    "icon": iconValues.reverse[icon],
    "note": noteValues.reverse[note],
    "image": imageValues.reverse[image],
    "cat_code": catCode,
    "cat_level": catLevelValues.reverse[catLevel],
    "serial": serial,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum CatLevel {
  ONE
}

final catLevelValues = EnumValues({
  "one": CatLevel.ONE
});

enum Icon {
  FA_FA_MALE
}

final iconValues = EnumValues({
  "fa fa-male": Icon.FA_FA_MALE
});

enum Image {
  ADMIN_CATEGORY_IMAGES_1651731283_WEBP
}

final imageValues = EnumValues({
  "./admin/category_images/1651731283.webp": Image.ADMIN_CATEGORY_IMAGES_1651731283_WEBP
});

enum Name {
  MENS_FASHION
}

final nameValues = EnumValues({
  "Mens Fashion": Name.MENS_FASHION
});

enum Note {
  MENS_FASHION_PRODUCT
}

final noteValues = EnumValues({
  "Mens Fashion Product": Note.MENS_FASHION_PRODUCT
});

enum Slug {
  MENS_FASHION
}

final slugValues = EnumValues({
  "mens-fashion": Slug.MENS_FASHION
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
