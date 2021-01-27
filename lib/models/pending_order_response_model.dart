import 'dart:convert';

// final String TABLE_PENDING_ORDER = 'TBL_PENDING_ORDER';
// final String COL_PENDING_ORDER_STATUS = 'PENDING_ORDER_STATUS';
// final String COL_PENDING_ORDER_DATA = 'PENDING_ORDER_DATA';
// final String COL_PENDING_ORDER_MSG = 'PENDING_ORDER_MSG';

PendingOrderResponseModel pendingOrderResponseFromJson(String str) =>
    PendingOrderResponseModel.fromJson(json.decode(str));

String pendingOrderResponseToJson(PendingOrderResponseModel data) =>
    json.encode(data.toJson());

class PendingOrderResponseModel {
  PendingOrderResponseModel({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  int status;
  bool success;
  List<PendingOrderData> data;
  String message;

  factory PendingOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      PendingOrderResponseModel(
        status: json["status"],
        success: json["success"],
        data: List<PendingOrderData>.from(json["data"].map((x) => PendingOrderData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };

  // Map<String, dynamic> toMap() => {
  //       COL_PENDING_ORDER_STATUS: status,
  //       COL_PENDING_ORDER_DATA: data,
  //       COL_PENDING_ORDER_MSG: message
  //     };
}

final String TABLE_PENDING_ORDER_DATA = 'TBL_PENDING_ORDER_DATA';
final String COL_PENDING_ORDER_DATA_ID = 'PENDING_ORDER_DATA_ID';
final String COL_PENDING_ORDER_DATA_SHOP_ID = 'PENDING_ORDER_DATA_SHOP_ID';
final String COL_PENDING_ORDER_DATA_CUSTOMER_ID =
    'PENDING_ORDER_DATA_CUSTOMER_ID';
final String COL_PENDING_ORDER_DATA_CREATED = 'PENDING_ORDER_DATA_CREATED';
final String COL_PENDING_ORDER_DATA_ORDER_ADDRESS =
    'PENDING_ORDER_DATA_ORDER_ADDRESS';
final String COL_PENDING_ORDER_DATA_ORDER_LATITUDE =
    'PENDING_ORDER_DATA_ORDER_LATITUDE';
final String COL_PENDING_ORDER_DATA_ORDER_LONGITUDE =
    'PENDING_ORDER_DATA_ORDER_LONGITUDE';
final String COL_PENDING_ORDER_DATA_ORDER_AREA =
    'PENDING_ORDER_DATA_ORDER_AREA';
final String COL_PENDING_ORDER_DATA_NAME = 'PENDING_ORDER_DATA_NAME';
final String COL_PENDING_ORDER_DATA_MOBILE_NUMBER =
    'PENDING_ORDER_DATA_MOBILE_NUMBER';
final String COL_PENDING_ORDER_DATA_EMAIL = 'PENDING_ORDER_DATA_EMAIL';
final String COL_PENDING_ORDER_DATA_PICTURE = 'PENDING_ORDER_DATA_PICTURE';
final String COL_PENDING_ORDER_DATA_DISTANCE = 'PENDING_ORDER_DATA_DISTANCE';

class PendingOrderData {
  PendingOrderData({
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

  factory PendingOrderData.fromJson(Map<String, dynamic> json) => PendingOrderData(
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

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COL_PENDING_ORDER_DATA_SHOP_ID: shopId,
      COL_PENDING_ORDER_DATA_CUSTOMER_ID: customerId,
      COL_PENDING_ORDER_DATA_CREATED: created.toIso8601String(),
      COL_PENDING_ORDER_DATA_ORDER_ADDRESS: orderAddress,
      COL_PENDING_ORDER_DATA_ORDER_LATITUDE: orderLatitude,
      COL_PENDING_ORDER_DATA_ORDER_LONGITUDE: orderLongitude,
      COL_PENDING_ORDER_DATA_ORDER_AREA: orderArea,
      COL_PENDING_ORDER_DATA_NAME: name,
      COL_PENDING_ORDER_DATA_MOBILE_NUMBER: mobileNumber,
      COL_PENDING_ORDER_DATA_EMAIL: email,
      COL_PENDING_ORDER_DATA_PICTURE: picture,
      COL_PENDING_ORDER_DATA_DISTANCE: distance
    };
    if (id != null) {
      map[COL_PENDING_ORDER_DATA_ID] = id;
    }
    return map;
  }

  PendingOrderData.fromMap(Map<String, dynamic> map) {
    id = map[COL_PENDING_ORDER_DATA_ID];
    shopId = map[COL_PENDING_ORDER_DATA_SHOP_ID];
    customerId = map[COL_PENDING_ORDER_DATA_CUSTOMER_ID];
    created = DateTime.parse(map[COL_PENDING_ORDER_DATA_CREATED]);
    orderAddress = map[COL_PENDING_ORDER_DATA_ORDER_ADDRESS];
    orderLatitude = map[COL_PENDING_ORDER_DATA_ORDER_LATITUDE];
    orderLongitude = map[COL_PENDING_ORDER_DATA_ORDER_LONGITUDE];
    orderArea = map[COL_PENDING_ORDER_DATA_ORDER_AREA];
    name = map[COL_PENDING_ORDER_DATA_NAME];
    mobileNumber = map[COL_PENDING_ORDER_DATA_MOBILE_NUMBER];
    email = map[COL_PENDING_ORDER_DATA_EMAIL];
    picture = map[COL_PENDING_ORDER_DATA_PICTURE];
    distance = map[COL_PENDING_ORDER_DATA_DISTANCE];
  }
}
