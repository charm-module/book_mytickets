// To parse this JSON data, do
//
//     final allshows10 = allshows10FromJson(jsonString);

import 'dart:convert';

Allshows10 allshows10FromJson(String str) =>
    Allshows10.fromJson(json.decode(str));

String allshows10ToJson(Allshows10 data) => json.encode(data.toJson());

class Allshows10 {
  bool success;
  List<Datum> data;

  Allshows10({
    required this.success,
    required this.data,
  });

  factory Allshows10.fromJson(Map<String, dynamic> json) => Allshows10(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String screenId;
  String ownerId;
  String ownerName;
  String location;
  String movieName;
  String showTime;
  DateTime startDate;
  DateTime endDate;
  int price;
  int screen;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
    required this.id,
    required this.screenId,
    required this.ownerId,
    required this.ownerName,
    required this.location,
    required this.movieName,
    required this.showTime,
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.screen,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        screenId: json["screenId"],
        ownerId: json["ownerId"],
        ownerName: json["ownerName"],
        location: json["location"],
        movieName: json["movieName"],
        showTime: json["showTime"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        price: json["price"],
        screen: json["screen"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "screenId": screenId,
        "ownerId": ownerId,
        "ownerName": ownerName,
        "location": location,
        "movieName": movieName,
        "showTime": showTime,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "price": price,
        "screen": screen,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
//



