// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types, unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owner/constants/endpoints/endpoint.dart';
import 'package:owner/constants/token.dart';
import 'package:owner/models/owner/sails10/dailysail.dart';
import 'package:owner/models/owner/sails10/monthlysail.dart';
import 'package:owner/models/owner/sails10/status10.dart';

dynamic jwt;

class get_monthyly_sails extends GetxController {
  var isLoading = false.obs;
  late Monthlysail10 reply;
  late Status10 reply2;
  late Dailysail10 reply3;

  getmonthlysail({required var ids}) async {
    // ignore: prefer_const_constructors
    final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);
    final bdy = {"_id": ids.toString()};
    try {
      isLoading(true);

      end j = end();
      final response = await http.post(Uri.parse(j.mothly_sail_url),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $sr'
          },
          body: jsonEncode(bdy));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        reply = Monthlysail10.fromJson(data);
        isLoading(false);

        print(
            "//////////${reply.data.userCount.map((e) => e.toString()).toList()}////////////////");

        update();

        return reply;
      } else {
        isLoading(false);
        print("failed");

        throw Exception("Failed");
      }
    } catch (e) {
      throw Exception("Failed$e");
    } finally {
      isLoading(false);
    }
  }

////////////////////////////////////////////////////////////////////////////////////
  getstatus_sail({required var ids}) async {
    // ignore: prefer_const_constructors
    final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);
    final bdy = {"_id": ids.toString()};
    try {
      isLoading(true);
      end j = end();
      final response = await http.post(Uri.parse(j.getsatus_url),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $sr'
          },
          body: jsonEncode(bdy));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        reply2 = Status10.fromJson(data);

        print(
            "//////////${reply2.data.map((e) => e).toList().toString()}////////////////");
        isLoading(false);

        update();

        return reply2;
      } else {
        isLoading(false);

        print("failed");

        throw Exception("Failed");
      }
    } catch (e) {
      throw Exception("Failed$e");
    } finally {
      isLoading(false);
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////
  getdaily_sail({required var ids}) async {
    // ignore: prefer_const_constructors
    final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);
    final bdy = {"_id": ids.toString()};
    try {
      isLoading(true);
      end j = end();
      final response = await http.post(Uri.parse(j.daily_sail_url),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $sr'
          },
          body: jsonEncode(bdy));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        reply3 = Dailysail10.fromJson(data);

        print(
            "//////////${reply.data.userCount.map((e) => e.toString()).toList()}////////////////");
        isLoading(false);

        update();

        return reply3;
      } else {
        isLoading(false);
        print("failed");

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
    getmonthlysail(ids: "");
    getstatus_sail(ids: "");
    getdaily_sail(ids: "");
  }
}
