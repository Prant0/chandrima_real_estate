class GatePassListModel {
  bool? status;
  Data? data;

  GatePassListModel({this.status, this.data});

  GatePassListModel.fromJson(Map<String, dynamic> json) {
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
  List<GatePassData>? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GatePassData>[];
      json['data'].forEach((v) {
        data!.add(GatePassData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GatePassData {
  int? id;
  String? gatePassId;
  String? gatepassType;
  String? visitorName;
  String? visitorPhone;
  String? visitorAddress;
  String? visitPurpose;
  String? entryDate;
  String? expiredDate;
  String? checkinDate;
  String? checkoutDate;
  String? referenceType;
  String? referenceBy;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleModel;
  String? drivingLicense;
  String? paymentMethod;
  String? paymentDetails;
  String? paymentDocuments;
  String? paymentStatus;
  String? note;
  String? status;
  int? requestedBy;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  GatePassData(
      {this.id,
        this.gatePassId,
        this.gatepassType,
        this.visitorName,
        this.visitorPhone,
        this.visitorAddress,
        this.visitPurpose,
        this.entryDate,
        this.expiredDate,
        this.checkinDate,
        this.checkoutDate,
        this.referenceType,
        this.referenceBy,
        this.vehicleType,
        this.vehicleNumber,
        this.vehicleModel,
        this.drivingLicense,
        this.paymentMethod,
        this.paymentDetails,
        this.paymentDocuments,
        this.paymentStatus,
        this.note,
        this.status,
        this.requestedBy,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  GatePassData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gatePassId = json['gate_pass_id'];
    gatepassType = json['gatepass_type'];
    visitorName = json['visitor_name'];
    visitorPhone = json['visitor_phone'];
    visitorAddress = json['visitor_address'];
    visitPurpose = json['visit_purpose'];
    entryDate = json['entry_date'];
    expiredDate = json['expired_date'];
    checkinDate = json['checkin_date'];
    checkoutDate = json['checkout_date'];
    referenceType = json['reference_type'];
    referenceBy = json['reference_by'];
    vehicleType = json['vehicle_type'];
    vehicleNumber = json['vehicle_number'];
    vehicleModel = json['vehicle_model'];
    drivingLicense = json['driving_license'];
    paymentMethod = json['payment_method'];
    paymentDetails = json['payment_details'];
    paymentDocuments = json['payment_documents'];
    paymentStatus = json['payment_status'];
    note = json['note'];
    status = json['status'];
    requestedBy = json['requested_by'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gate_pass_id'] = gatePassId;
    data['gatepass_type'] = gatepassType;
    data['visitor_name'] = visitorName;
    data['visitor_phone'] = visitorPhone;
    data['visitor_address'] = visitorAddress;
    data['visit_purpose'] = visitPurpose;
    data['entry_date'] = entryDate;
    data['expired_date'] = expiredDate;
    data['checkin_date'] = checkinDate;
    data['checkout_date'] = checkoutDate;
    data['reference_type'] = referenceType;
    data['reference_by'] = referenceBy;
    data['vehicle_type'] = vehicleType;
    data['vehicle_number'] = vehicleNumber;
    data['vehicle_model'] = vehicleModel;
    data['driving_license'] = drivingLicense;
    data['payment_method'] = paymentMethod;
    data['payment_details'] = paymentDetails;
    data['payment_documents'] = paymentDocuments;
    data['payment_status'] = paymentStatus;
    data['note'] = note;
    data['status'] = status;
    data['requested_by'] = requestedBy;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}