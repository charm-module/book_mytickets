// To parse this JSON data, do
//
//     final status10 = status10FromJson(jsonString);

import 'dart:convert';

Status10 status10FromJson(String str) => Status10.fromJson(json.decode(str));

String status10ToJson(Status10 data) => json.encode(data.toJson());

class Status10 {
    bool success;
    String message;
    List<int> data;

    Status10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Status10.fromJson(Map<String, dynamic> json) => Status10(
        success: json["success"],
        message: json["message"],
        data: List<int>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}
