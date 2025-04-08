// ignore_for_file: camel_case_types, unused_local_variable

import 'dart:convert';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:owner/constants/endpoints/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:owner/models/owner/auth/singup.dart';

class registerService extends GetxController {
  late Ownersignup10 reply;

  Rx<XFile?> img = Rx<XFile?>(null);

  pick() async {
    ///ImagePicker pi = ImagePicker();
    final data = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (data != null) {
      img.value = data;

      update();
    }
    update();
  }

  var isloading = false.obs;

  end e = end();
  // ignore: non_constant_identifier_names
  getowner_otpservice({
    required String thetername,
    required String email,
    required String licence,
    required String phone,
    required String location,
    required String idproof,
    required String password,
  }) async {
    final Map<String, dynamic> bdy = {
      "Name": thetername.toString(),
      "Email": email.toString(),
      "Adhaar": idproof.toString(),
      "Licence": licence.toString(),
      "Location": location.toString(),
      "Phone": phone.toString(),
      "Password": password.toString(),
    };
    try {
      final response = await http.post(
          Uri.parse("https://bookmyscreen.onrender.com/owner/ownerOtp"),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json'
          },
          body: jsonEncode(bdy),
          encoding: Encoding.getByName('utf-8'));

      if (response.statusCode == 200) {
        var reply = jsonDecode(response.body.toString());
        update();

        // ignore: avoid_print
        print(
            "<------singup------------------${reply.toString()}------------signup----------------->");
      } else {
        update();
        throw ("singup is failed");
      }
    } catch (e) {
      throw ("otp failed$e ");
    }
    update();
  }
}
