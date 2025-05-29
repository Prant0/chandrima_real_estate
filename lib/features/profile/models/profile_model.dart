class ProfileModel {
  bool? status;
  Data? data;

  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  Member? member;
  List<Plots>? plots;
  List<FamilyMembers>? familyMembers;
  List<Tenants>? tenants;
  List<Payments>? payments;
  List<AllFlatModel>? flats;
  bool ?isExpanded = true;
  List<Documents>? documents;

  Data({
    this.member,
    this.plots,
    this.familyMembers,
    this.tenants,
    this.isExpanded,
    this.flats,
    this.payments,this.documents
  });

  Data.fromJson(Map<String, dynamic> json) {
    member = json['member'] != null ? Member.fromJson(json['member']) : null;
    if (json['plots'] != null) {
      plots = <Plots>[];
      json['plots'].forEach((v) {
        plots!.add(Plots.fromJson(v));
      });
    }

    if (json['allflats'] != null) {
      flats = <AllFlatModel>[];
      json['allflats'].forEach((v) {
        flats!.add(AllFlatModel.fromJson(v));
      });
    }
    if (json['familyMembers'] != null) {
      familyMembers = <FamilyMembers>[];
      json['familyMembers'].forEach((v) {
        familyMembers!.add(FamilyMembers.fromJson(v));
      });
    }
    if (json['other_documents'] != null) {
      documents = <Documents>[];
      json['other_documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
    if (json['tenants'] != null) {
      tenants = <Tenants>[];
      json['tenants'].forEach((v) {
        tenants!.add(Tenants.fromJson(v));
      });
    }

    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }

  }

}

class Member {
  String? memberId;
  String? memberType;
  String? name;
  String? gender;
  String? mobile;
  String? email;
  String? photo;
  String? presentAddress;
  String? permanentAddress;
  String? landQty;
  String? totalLand;
  dynamic? nidNumber;
  String? nidPhoto;

  String? nameOfPower;
  String? remarks;
  String? status;
  String? memberSine;

  Member({
    this.memberId,
    this.memberType,
    this.name,
    this.gender,
    this.mobile,
    this.email,
    this.photo,
    this.presentAddress,
    this.permanentAddress,
    this.landQty,
    this.totalLand,
    this.nidNumber,
    this.nidPhoto,
    this.nameOfPower,
    this.remarks,
    this.status,
    this.memberSine,
  });

  Member.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    memberType = json['member_type'];
    name = json['name'];
    gender = json['gender'];
    mobile = json['mobile'];
    email = json['email'];
    photo = json['photo'];
    presentAddress = json['present_address'];
    permanentAddress = json['permanent_address'];
    landQty = json['land_qty'];
    totalLand = json['total_land'];
    nidNumber = json['nid_number'];
    nidPhoto = json['nid_photo'];

    nameOfPower = json['name_of_power'];
    remarks = json['remarks'];
    status = json['status'];
    memberSine = json['member_sine'];
  }

}


class Documents {
  String? title;
  List<String>? documents;

  Documents({
    this.title,
    this.documents,
  });

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
    title: json["title"],
    documents: json["documents"] == null ? [] : List<String>.from(json["documents"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "documents": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x)),
  };
}


class Plots {
  int? id;
  String? memberId;
  String? developBy;
  int? projectId;
  String? plotNo;
  String? landCondition;
  dynamic? netLand;
  dynamic? deedNo;
  String? houseNumber;
  String? roadNumber;
  String? blockNumber;
  String? date;
  String? documents;
  String? createdAt;
  String? updatedAt;
  List<GetFlats>? getFlats;
  bool ?isExpanded = true;

  Plots({
    this.id,
    this.memberId,
    this.developBy,
    this.projectId,
    this.plotNo,
    this.landCondition,
    this.netLand,
    this.deedNo,
    this.houseNumber,
    this.roadNumber,
    this.blockNumber,
    this.date,
    this.documents,
    this.createdAt,
    this.updatedAt,
    this.getFlats,
    this.isExpanded
  });

  Plots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    developBy = json['develop_by'];
    projectId = json['project_id'];
    plotNo = json['plot_no'];
    landCondition = json['land_condition'];
    netLand = json['net_land'];
    deedNo = json['deed_no'];
    houseNumber = json['house_number'];
    roadNumber = json['road_number'];
    blockNumber = json['block_number'];
    date = json['date'];
    documents = json['documents'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['get_flats'] != null) {
      getFlats = <GetFlats>[];
      json['get_flats'].forEach((v) {
        getFlats!.add(GetFlats.fromJson(v));
      });
    }
  }


}

class GetFlats {
  int? id;
  String? memberId;
  dynamic? plotId;
  String? flatSize;
  String? flatNo,flat_id;
  String? flatType;
  String? csRecord;
  String? csFiles;
  String? rsRecord;
  String? rsFiles;
  String? bsRecord;
  String? bsFiles;
  String? mutationNumber;
  String? mutationDocument;
  String? createdAt;
  String? updatedAt;
  var getPurchasedBy;

  GetFlats({
    this.id,
    this.memberId,
    this.plotId,
    this.flatSize,
    this.flatNo,
    this.flatType,
    this.csRecord,
    this.csFiles,
    this.rsRecord,
    this.rsFiles,
    this.bsRecord,this.flat_id,
    this.bsFiles,
    this.mutationNumber,
    this.mutationDocument,
    this.createdAt,
    this.updatedAt,
    this.getPurchasedBy
  });

  GetFlats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    plotId = json['plot_id'];
    flatSize = json['flat_size'];
    flatNo = json['flat_no'];
    flat_id = json['flat_id'];
    flatType = json['flat_type'];
    csRecord = json['cs_record'];
    csFiles = json['cs_files'];
    rsRecord = json['rs_record'];
    rsFiles = json['rs_files'];
    bsRecord = json['bs_record'];
    bsFiles = json['bs_files'];
    mutationNumber = json['mutation_number'];
    mutationDocument = json['mutation_document'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getPurchasedBy=json['get_purchased_by'];
  }


}

class FamilyMembers {
  int? id;
  String? familyId;
  String? memberId;
  String? name;
  String? mobile;
  dynamic email;
  String? photo;
  String? gender;
  DateTime? birthday;
  String? relation;
  dynamic nidNumber;
  dynamic nidImage;
  dynamic address;
  dynamic permanentAddress;
  dynamic familyFor;
  String? idCardReason;
  String? idCardStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  FamilyMembers({
    this.id,
    this.familyId,
    this.memberId,
    this.name,
    this.mobile,
    this.email,
    this.photo,
    this.gender,
    this.birthday,
    this.relation,
    this.nidNumber,
    this.nidImage,
    this.address,
    this.permanentAddress,
    this.familyFor,
    this.idCardReason,
    this.idCardStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory FamilyMembers.fromJson(Map<String, dynamic> json) => FamilyMembers(
    id: json["id"],
    familyId: json["family_id"],
    memberId: json["member_id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    photo: json["photo"],
    gender: json["gender"],
    birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
    relation: json["relation"],
    nidNumber: json["nid_number"],
    nidImage: json["nid_image"],
    address: json["address"],
    permanentAddress: json["permanent_address"],
    familyFor: json["family_for"],
    idCardReason: json["id_card_reason"],
    idCardStatus: json["id_card_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "family_id": familyId,
    "member_id": memberId,
    "name": name,
    "mobile": mobile,
    "email": email,
    "photo": photo,
    "gender": gender,
    "birthday": "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "relation": relation,
    "nid_number": nidNumber,
    "nid_image": nidImage,
    "address": address,
    "permanent_address": permanentAddress,
    "family_for": familyFor,
    "id_card_reason": idCardReason,
    "id_card_status": idCardStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}



class AllFlatModel {
  int? id;
  String? flatNo;
  String? houseNumber;

  AllFlatModel({
    this.id,
    this.flatNo,
    this.houseNumber,
  });

  factory AllFlatModel.fromJson(Map<String, dynamic> json) => AllFlatModel(
    id: json["id"],
    flatNo: json["flat_no"],
    houseNumber: json["house_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "flat_no": flatNo,
    "house_number": houseNumber,
  };
}


class Tenants {
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
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Tenants({
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
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Tenants.fromJson(Map<String, dynamic> json) => Tenants(
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

  Document({
    this.documentTitle,
    this.documentFile,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    documentTitle: json["document_title"],
    documentFile: json["document_file"] == null ? [] : List<String>.from(json["document_file"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "document_title": documentTitle,
    "document_file": documentFile == null ? [] : List<dynamic>.from(documentFile!.map((x) => x)),
  };
}




class Payments {
  int? id;
  String? memberId;
  String? invoiceId;
  dynamic name;
  dynamic phone;
  dynamic details;
  List<Service>? services;
  String? invoiceType;
  String? invoiceFor;
  int? totalDiscount;
  int? paidAmount;
  int? totalAmount;
  int? partialPayment;
  DateTime? paymentDate;
  dynamic paymentMonths;
  String? paymentMethod;
  String? paymentDetails;
  dynamic paymentDocuments;
  String? note;
  String? paymentStatus;
  int? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Payments({
    this.id,
    this.memberId,
    this.invoiceId,
    this.name,
    this.phone,
    this.details,
    this.services,
    this.invoiceType,
    this.invoiceFor,
    this.totalDiscount,
    this.paidAmount,
    this.totalAmount,
    this.partialPayment,
    this.paymentDate,
    this.paymentMonths,
    this.paymentMethod,
    this.paymentDetails,
    this.paymentDocuments,
    this.note,
    this.paymentStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Payments.fromJson(Map<String, dynamic> json) => Payments(
    id: json["id"],
    memberId: json["member_id"],
    invoiceId: json["invoice_id"],
    name: json["name"],
    phone: json["phone"],
    details: json["details"],
    services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
    invoiceType: json["invoice_type"],
    invoiceFor: json["invoice_for"],
    totalDiscount: json["total_discount"],
    paidAmount: json["paid_amount"],
    totalAmount: json["total_amount"],
    partialPayment: json["partial_payment"],
    paymentDate: json["payment_date"] == null ? null : DateTime.parse(json["payment_date"]),
    paymentMonths: json["payment_months"],
    paymentMethod: json["payment_method"],
    paymentDetails: json["payment_details"],
    paymentDocuments: json["payment_documents"],
    note: json["note"],
    paymentStatus: json["payment_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "member_id": memberId,
    "invoice_id": invoiceId,
    "name": name,
    "phone": phone,
    "details": details,
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
    "invoice_type": invoiceType,
    "invoice_for": invoiceFor,
    "total_discount": totalDiscount,
    "paid_amount": paidAmount,
    "total_amount": totalAmount,
    "partial_payment": partialPayment,
    "payment_date": "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
    "payment_months": paymentMonths,
    "payment_method": paymentMethod,
    "payment_details": paymentDetails,
    "payment_documents": paymentDocuments,
    "note": note,
    "payment_status": paymentStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Service {
  String? serviceName;
  dynamic? serviceCharge;
  dynamic? discount;

  Service({
    this.serviceName,
    this.serviceCharge,
    this.discount,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    serviceName: json["service_name"],
    serviceCharge: json["service_charge"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "service_name": serviceName,
    "service_charge": serviceCharge,
    "discount": discount,
  };
}
