// To parse this JSON data, do
//
//     final monthlysail10 = monthlysail10FromJson(jsonString);

import 'dart:convert';

Monthlysail10 monthlysail10FromJson(String str) => Monthlysail10.fromJson(json.decode(str));

String monthlysail10ToJson(Monthlysail10 data) => json.encode(data.toJson());

class Monthlysail10 {
    bool success;
    String message;
    Data data;

    Monthlysail10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Monthlysail10.fromJson(Map<String, dynamic> json) => Monthlysail10(
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
    List<double> userCount;
    double years;

    Data({
        required this.userCount,
        required this.years,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userCount: List<double>.from(json["userCount"].map((x) => x?.toDouble())),
        years: json["years"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "userCount": List<dynamic>.from(userCount.map((x) => x)),
        "years": years,
    };
}
