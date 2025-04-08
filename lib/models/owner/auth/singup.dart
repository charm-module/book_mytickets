// To parse this JSON data, do
//
//     final ownersignup10 = ownersignup10FromJson(jsonString);

import 'dart:convert';

Ownersignup10 ownersignup10FromJson(String str) => Ownersignup10.fromJson(json.decode(str));

String ownersignup10ToJson(Ownersignup10 data) => json.encode(data.toJson());

class Ownersignup10 {
    String name;
    String email;
    String adhaar;
    String licence;
    String location;
    String phone;
    String password;

    Ownersignup10({
        required this.name,
        required this.email,
        required this.adhaar,
        required this.licence,
        required this.location,
        required this.phone,
        required this.password,
    });

    factory Ownersignup10.fromJson(Map<String, dynamic> json) => Ownersignup10(
        name: json["Name"],
        email: json["Email"],
        adhaar: json["Adhaar"],
        licence: json["Licence"],
        location: json["Location"],
        phone: json["Phone"],
        password: json["Password"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Email": email,
        "Adhaar": adhaar,
        "Licence": licence,
        "Location": location,
        "Phone": phone,
        "Password": password,
    };
}
