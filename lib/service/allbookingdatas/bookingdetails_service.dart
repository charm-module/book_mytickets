// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types, unused_local_variable

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owner/constants/endpoints/endpoint.dart';
import 'package:owner/constants/token.dart';
import 'package:owner/models/owner/allbook10/allbook10.dart';

dynamic jwt;

class get_booking_details extends GetxController {
  var isLoading = false.obs;

  late Allbook10 reply;

  getbooking({required var id}) async {
    // ignore: prefer_const_constructors
    final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);
    try {
      isLoading(true);
      end j = end();
      final response = await http
          .get(Uri.parse("${j.getbooking_url}${id.toString()}"), headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $sr'
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        reply = Allbook10.fromJson(data);
        print(
            "-<------------------------${reply.data.map((e) => e.movieName.toString())}------------------------->-");

        update();
        isLoading(false);
        return reply;
      } else {
        print("failed");
        isLoading(false);
        throw Exception("Failed");
      }
    } catch (e) {
      throw Exception("Failed$e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getbooking(id: "");
  }

  @override
  void dispose() {
    super.dispose();
    getbooking(id: "");
  }
}
