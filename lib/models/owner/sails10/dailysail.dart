// To parse this JSON data, do
//
//     final dailysail10 = dailysail10FromJson(jsonString);

import 'dart:convert';

Dailysail10 dailysail10FromJson(String str) => Dailysail10.fromJson(json.decode(str));

String dailysail10ToJson(Dailysail10 data) => json.encode(data.toJson());

class Dailysail10 {
    bool success;
    String message;
    Data data;

    Dailysail10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Dailysail10.fromJson(Map<String, dynamic> json) => Dailysail10(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int total;
    int expiredCount;
    int activeCount;
    int screenCount;
    int showCount;
    int orderCount;

    Data({
        required this.total,
        required this.expiredCount,
        required this.activeCount,
        required this.screenCount,
        required this.showCount,
        required this.orderCount,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        expiredCount: json["expiredCount"],
        activeCount: json["activeCount"],
        screenCount: json["screenCount"],
        showCount: json["showCount"],
        orderCount: json["orderCount"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "expiredCount": expiredCount,
        "activeCount": activeCount,
        "screenCount": screenCount,
        "showCount": showCount,
        "orderCount": orderCount,
    };
}
