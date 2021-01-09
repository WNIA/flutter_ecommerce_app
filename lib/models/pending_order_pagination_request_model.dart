import 'dart:convert';

PendingOrderPaginationRequestModel pendingOrderPaginationRequestFromJson(String str) => PendingOrderPaginationRequestModel.fromJson(json.decode(str));

String pendingOrderPaginationRequestToJson(PendingOrderPaginationRequestModel data) => json.encode(data.toJson());

class PendingOrderPaginationRequestModel {
  PendingOrderPaginationRequestModel({
    this.limit,
    this.page,
    this.latitude,
    this.longititude,
  });

  int limit;
  int page;
  double latitude;
  double longititude;

  factory PendingOrderPaginationRequestModel.fromJson(Map<String, dynamic> json) => PendingOrderPaginationRequestModel(
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
