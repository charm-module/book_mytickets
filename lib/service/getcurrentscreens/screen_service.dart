// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types, unused_local_variable, unnecessary_brace_in_string_interps, invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owner/constants/endpoints/endpoint.dart';
import 'package:owner/constants/token.dart';
import 'package:owner/controller/storage.dart';
import 'package:owner/models/owner/screen10/screen10.dart';
import 'package:owner/service/owners/authentication/login.dart';

dynamic jwt;

class get_current_screens extends GetxController {
  // final dsa = Get.put(get_current_screens());

  final logserv = Get.put(loginService());

  var isLoading = false.obs;

  var dcp = <dynamic>[].obs;

  late Screen10 reply;

  Screen10 get repy => reply;

  var screens = <Map<String, dynamic>>[].obs;
  var nata = {}.obs;

  Future getscreens({required var id}) async {
    localstorage store = localstorage();
    // ignore: prefer_const_constructors
    final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);

    try {
      isLoading(true);
      end j = end();
      final response =
          await http.get(Uri.parse("${j.screen_url}${id}"), headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sr}'
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        reply = Screen10.fromJson(data);

        isLoading(false);

        print(">--------------${dcp}---------------->");

        print(
            "-<-------sucess--------------${reply.data.map((e) => e.columns.toString()).toList().toString()}---------sucess--------->");
        update();
        //}//
        return reply.data;
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
    // fetchdata(id: "");

    getscreens(id: "");
  }
}
