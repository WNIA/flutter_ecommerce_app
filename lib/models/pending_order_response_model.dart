import 'dart:convert';

PendingOrderResponseModel pendingOrderResponseFromJson(String str) => PendingOrderResponseModel.fromJson(json.decode(str));

String pendingOrderResponseToJson(PendingOrderResponseModel data) => json.encode(data.toJson());

class PendingOrderResponseModel {
  PendingOrderResponseModel({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  int status;
  bool success;
  List<Data> data;
  String message;

  factory PendingOrderResponseModel.fromJson(Map<String, dynamic> json) => PendingOrderResponseModel(
    status: json["status"],
    success: json["success"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Data {
  Data({
    this.id,
    this.shopId,
    this.customerId,
    this.created,
    this.orderAddress,
    this.orderLatitude,
    this.orderLongitude,
    this.orderArea,
    this.name,
    this.mobileNumber,
    this.email,
    this.picture,
    this.distance,
  });

  int id;
  int shopId;
  int customerId;
  DateTime created;
  String orderAddress;
  double orderLatitude;
  double orderLongitude;
  String orderArea;
  String name;
  String mobileNumber;
  String email;
  String picture;
  double distance;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["Id"],
    shopId: json["ShopId"],
    customerId: json["CustomerId"],
    created: DateTime.parse(json["Created"]),
    orderAddress: json["OrderAddress"],
    orderLatitude: json["OrderLatitude"].toDouble(),
    orderLongitude: json["OrderLongitude"].toDouble(),
    orderArea: json["OrderArea"],
    name: json["Name"],
    mobileNumber: json["MobileNumber"],
    email: json["Email"],
    picture: json["Picture"],
    distance: json["distance"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ShopId": shopId,
    "CustomerId": customerId,
    "Created": created.toIso8601String(),
    "OrderAddress": orderAddress,
    "OrderLatitude": orderLatitude,
    "OrderLongitude": orderLongitude,
    "OrderArea": orderArea,
    "Name": name,
    "MobileNumber": mobileNumber,
    "Email": email,
    "Picture": picture,
    "distance": distance,
  };
}

