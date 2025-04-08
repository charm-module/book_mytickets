// To parse this JSON data, do
//
//     final currentowner10 = currentowner10FromJson(jsonString);

import 'dart:convert';

Currentowner10 currentowner10FromJson(String str) => Currentowner10.fromJson(json.decode(str));

String currentowner10ToJson(Currentowner10 data) => json.encode(data.toJson());

class Currentowner10 {
    bool success;
    String message;
    Data data;

    Currentowner10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Currentowner10.fromJson(Map<String, dynamic> json) => Currentowner10(
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
    String id;
    String name;
    int phone;
    String email;
    String licence;
    int adhaar;
    String location;
    int wallet;
    String images;
    String status;
    bool block;
    int v;

    Data({
        required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.licence,
        required this.adhaar,
        required this.location,
        required this.wallet,
        required this.images,
        required this.status,
        required this.block,
        required this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["Name"],
        phone: json["Phone"],
        email: json["Email"],
        licence: json["Licence"],
        adhaar: json["Adhaar"],
        location: json["Location"],
        wallet: json["wallet"],
        images: json["images"],
        status: json["status"],
        block: json["block"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Phone": phone,
        "Email": email,
        "Licence": licence,
        "Adhaar": adhaar,
        "Location": location,
        "wallet": wallet,
        "images": images,
        "status": status,
        "block": block,
        "__v": v,
    };
}

