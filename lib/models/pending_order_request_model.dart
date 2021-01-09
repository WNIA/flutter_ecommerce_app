import 'dart:convert';

PendingOrderRequestModel pendingOrderRequestFromJson(String str) => PendingOrderRequestModel.fromJson(json.decode(str));

String pendingOrderRequestToJson(PendingOrderRequestModel data) => json.encode(data.toJson());

class PendingOrderRequestModel {
  PendingOrderRequestModel({
    this.limit,
    this.page,
    this.latitude,
    this.longititude,
  });

  int limit;
  int page;
  double latitude;
  double longititude;

  factory PendingOrderRequestModel.fromJson(Map<String, dynamic> json) => PendingOrderRequestModel(
    limit: json["limit"],
    page: json["page"],
    latitude: json["Latitude"].toDouble(),
    longititude: json["Longititude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "limit": limit,
    "page": page,
    "Latitude": latitude,
    "Longititude": longititude,
  };
}
