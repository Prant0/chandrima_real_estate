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
  List<Events>? events;
  List<Payments>? payments;
  bool ?isExpanded = true;

  Data({
    this.member,
    this.plots,
    this.familyMembers,
    this.tenants,
    this.events,
    this.isExpanded,
    this.payments
  });

  Data.fromJson(Map<String, dynamic> json) {
    member = json['member'] != null ? Member.fromJson(json['member']) : null;
    if (json['plots'] != null) {
      plots = <Plots>[];
      json['plots'].forEach((v) {
        plots!.add(Plots.fromJson(v));
      });
    }
    if (json['familyMembers'] != null) {
      familyMembers = <FamilyMembers>[];
      json['familyMembers'].forEach((v) {
        familyMembers!.add(FamilyMembers.fromJson(v));
      });
    }
    if (json['tenants'] != null) {
      tenants = <Tenants>[];
      json['tenants'].forEach((v) {
        tenants!.add(Tenants.fromJson(v));
      });
    }
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
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
  List<Documents>? documents;
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
    this.documents,
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
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
    nameOfPower = json['name_of_power'];
    remarks = json['remarks'];
    status = json['status'];
    memberSine = json['member_sine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_id'] = memberId;
    data['member_type'] = memberType;
    data['name'] = name;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['email'] = email;
    data['photo'] = photo;
    data['present_address'] = presentAddress;
    data['permanent_address'] = permanentAddress;
    data['land_qty'] = landQty;
    data['total_land'] = totalLand;
    data['nid_number'] = nidNumber;
    data['nid_photo'] = nidPhoto;
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    data['name_of_power'] = nameOfPower;
    data['remarks'] = remarks;
    data['status'] = status;
    data['member_sine'] = memberSine;
    return data;
  }
}

class Documents {
  String? documentTitle;
  String? documentFile;

  Documents({this.documentTitle, this.documentFile});

  Documents.fromJson(Map<String, dynamic> json) {
    documentTitle = json['document_title'];
    documentFile = json['document_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['document_title'] = documentTitle;
    data['document_file'] = documentFile;
    return data;
  }
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
  int? plotId;
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
  String? memberId;
  String? familyId;
  String? name;
  String? mobile;
  String? email;
  String? photo;
  String? gender;
  String? birthday;
  String? relation;
  String? nidNumber;
  String? nidImage,address,id_card_status;
  String? createdAt;
  String? updatedAt;

  FamilyMembers({
    this.id,
    this.memberId,
    this.name,
    this.mobile,
    this.email,
    this.photo,
    this.gender,
    this.birthday,
    this.relation,
    this.nidNumber,this.address,
    this.nidImage,
    this.createdAt,
    this.updatedAt,
    this.familyId,
    this.id_card_status,
  });

  FamilyMembers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    familyId = json['family_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    photo = json['photo'];
    gender = json['gender'];
    birthday = json['birthday'];
    id_card_status = json['id_card_status'];
    relation = json['relation'];
    nidNumber = json['nid_number'];
    nidImage = json['nid_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['photo'] = photo;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['relation'] = relation;
    data['nid_number'] = nidNumber;
    data['nid_image'] = nidImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tenants {
  int? id;
  String? memberId;
  String? tenantId;
  String? name;
  String? mobile;
  String? email;
  String? photo;
  String? gender;
  String? birthday;
  String? houseNumber;
  String? flatNo;
  String? advanceRent;
  String? rentPerMonth;
  String? rentMonth;
  String? rentYear;
  String? nidNumber;
  dynamic nidImage;
  String? address,permanent_address;
  String? status;
  String? createdAt;
  String? updatedAt;

  Tenants({
    this.id,
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
    this.address,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tenantId,
    this.permanent_address
  });

  Tenants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    tenantId = json['tenant_id'];
    name = json['name'];
    mobile = json['mobile'];
    permanent_address = json['permanent_address'];
    email = json['email'];
    photo = json['photo'];
    gender = json['gender'];
    birthday = json['birthday'];
    houseNumber = json['house_number'];
    flatNo = json['flat_no'];
    advanceRent = json['advance_rent'];
    rentPerMonth = json['rent_per_month'];
    rentMonth = json['rent_month'];
    rentYear = json['rent_year'];
    nidNumber = json['nid_number'];
    nidImage = json['nid_image'];
    address = json['address'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['photo'] = photo;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['house_number'] = houseNumber;
    data['flat_no'] = flatNo;
    data['advance_rent'] = advanceRent;
    data['rent_per_month'] = rentPerMonth;
    data['rent_month'] = rentMonth;
    data['rent_year'] = rentYear;
    data['nid_number'] = nidNumber;
    data['nid_image'] = nidImage;
    data['address'] = address;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Events {
  int? id;
  dynamic userId;
  String? title;
  String? description;
  String? eventSending;
  DateTime? sendingDate;
  String? block;
  String? eventTo;
  dynamic startDate;
  dynamic endDate;
  String? notifyVia;
  String? status;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Events({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.eventSending,
    this.sendingDate,
    this.block,
    this.eventTo,
    this.startDate,
    this.endDate,
    this.notifyVia,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Events.fromJson(Map<String, dynamic> json) => Events(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    description: json["description"],
    eventSending: json["event_sending"],
    sendingDate: json["sending_date"] == null ? null : DateTime.parse(json["sending_date"]),
    block: json["block"],
    eventTo: json["event_to"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    notifyVia: json["notify_via"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "description": description,
    "event_sending": eventSending,
    "sending_date": sendingDate?.toIso8601String(),
    "block": block,
    "event_to": eventTo,
    "start_date": startDate,
    "end_date": endDate,
    "notify_via": notifyVia,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
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
  int? serviceCharge;
  String? discount;

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
