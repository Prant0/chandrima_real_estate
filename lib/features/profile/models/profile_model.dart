class ProfileModel {
  bool? status;
  Data? data;

  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Member? member;
  List<Plots>? plots;
  List<FamilyMembers>? familyMembers;
  List<Tenants>? tenants;
  List<Events>? events;
  bool ?isExpanded = true;

  Data({
    this.member,
    this.plots,
    this.familyMembers,
    this.tenants,
    this.events,
    this.isExpanded,
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (member != null) {
      data['member'] = member!.toJson();
    }
    if (plots != null) {
      data['plots'] = plots!.map((v) => v.toJson()).toList();
    }
    if (familyMembers != null) {
      data['familyMembers'] = familyMembers!.map((v) => v.toJson()).toList();
    }
    if (tenants != null) {
      data['tenants'] = tenants!.map((v) => v.toJson()).toList();
    }
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['develop_by'] = developBy;
    data['project_id'] = projectId;
    data['plot_no'] = plotNo;
    data['land_condition'] = landCondition;
    data['net_land'] = netLand;
    data['deed_no'] = deedNo;
    data['house_number'] = houseNumber;
    data['road_number'] = roadNumber;
    data['block_number'] = blockNumber;
    data['date'] = date;
    data['documents'] = documents;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (getFlats != null) {
      data['get_flats'] = getFlats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetFlats {
  int? id;
  String? memberId;
  int? plotId;
  String? flatSize;
  String? flatNo;
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
    this.bsRecord,
    this.bsFiles,
    this.mutationNumber,
    this.mutationDocument,
    this.createdAt,
    this.updatedAt,
  });

  GetFlats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    plotId = json['plot_id'];
    flatSize = json['flat_size'];
    flatNo = json['flat_no'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['plot_id'] = plotId;
    data['flat_size'] = flatSize;
    data['flat_no'] = flatNo;
    data['flat_type'] = flatType;
    data['cs_record'] = csRecord;
    data['cs_files'] = csFiles;
    data['rs_record'] = rsRecord;
    data['rs_files'] = rsFiles;
    data['bs_record'] = bsRecord;
    data['bs_files'] = bsFiles;
    data['mutation_number'] = mutationNumber;
    data['mutation_document'] = mutationDocument;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class FamilyMembers {
  int? id;
  String? memberId;
  String? name;
  String? mobile;
  String? email;
  String? photo;
  String? gender;
  String? birthday;
  String? relation;
  String? nidNumber;
  String? nidImage;
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
    this.nidNumber,
    this.nidImage,
    this.createdAt,
    this.updatedAt,
  });

  FamilyMembers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    photo = json['photo'];
    gender = json['gender'];
    birthday = json['birthday'];
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
  String? nidImage;
  String? address;
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
  });

  Tenants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    name = json['name'];
    mobile = json['mobile'];
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
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? eventTo;
  String? userId;
  String? notifyVia;
  String? status;
  String? createdAt;
  String? updatedAt;

  Events({
    this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.eventTo,
    this.userId,
    this.notifyVia,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    eventTo = json['event_to'];
    userId = json['user_id'];
    notifyVia = json['notify_via'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['event_to'] = eventTo;
    data['user_id'] = userId;
    data['notify_via'] = notifyVia;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}