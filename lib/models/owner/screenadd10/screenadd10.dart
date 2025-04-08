// To parse this JSON data, do
//
//     final screenadd10 = screenadd10FromJson(jsonString);

import 'dart:convert';

Screenadd10 screenadd10FromJson(String str) => Screenadd10.fromJson(json.decode(str));

String screenadd10ToJson(Screenadd10 data) => json.encode(data.toJson());

class Screenadd10 {
    bool success;
    String message;
    List<Datum> data;

    Screenadd10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Screenadd10.fromJson(Map<String, dynamic> json) => Screenadd10(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    int screen;
    int rows;
    int columns;
    int totalSeats;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Datum({
        required this.id,
        required this.screen,
        required this.rows,
        required this.columns,
        required this.totalSeats,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        screen: json["screen"],
        rows: json["rows"],
        columns: json["columns"],
        totalSeats: json["totalSeats"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "screen": screen,
        "rows": rows,
        "columns": columns,
        "totalSeats": totalSeats,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
