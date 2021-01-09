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
  Name name;
  String mobileNumber;
  Email email;
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
    name: nameValues.map[json["Name"]],
    mobileNumber: json["MobileNumber"],
    email: emailValues.map[json["Email"]],
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
    "Name": nameValues.reverse[name],
    "MobileNumber": mobileNumber,
    "Email": emailValues.reverse[email],
    "Picture": picture,
    "distance": distance,
  };
}

enum Email { EVANKHAN1000_GMAIL_COM }

final emailValues = EnumValues({
  "evankhan1000@gmail.com": Email.EVANKHAN1000_GMAIL_COM
});

enum Name { EVAN_AHMED }

final nameValues = EnumValues({
  "Evan Ahmed": Name.EVAN_AHMED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
