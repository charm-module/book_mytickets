// ignore_for_file: camel_case_types, unused_local_variable, unnecessary_brace_in_string_interps, avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:owner/constants/endpoints/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:owner/constants/token.dart';
import 'package:owner/models/owner/screenadd10/screenadd10.dart';
import 'package:owner/view/screens/screenManagement/screenmanagement.dart';

class screen_add_Service extends GetxController {
  var isloading = false.obs;

  end e = end();
  late Screenadd10 reply;
  RxList<Screenadd10> alldata = <Screenadd10>[].obs;

  // ignore: non_constant_identifier_names
  getadd_screen_service(
      {required String ownerid,
      required String screenno,
      required String rows,
      required String columns,
      BuildContext? context}) async {
    // ignore: prefer_const_constructors
    final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);
    final bdy = {
      "owner": {"_id": ownerid},
      "screen": screenno,
      "rows": rows,
      "columns": columns,
    };
    try {
      ///  isloading(true);
      final response = await http.post(Uri.parse(e.addscreen_url),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $sr'
          },
          body: jsonEncode(bdy),
          encoding: Encoding.getByName('utf-8'));

      if (response.statusCode == 200) {
        var resp = jsonDecode(response.body);
        print(
            "-<------getit----------------{$resp.toString()}------getit------------------>");
        Navigator.of(context!)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return screenMangement();
        }));

        update();

        return resp;
      } else {
        //  isloading(false);
        update();
        throw ("its failed${response.statusCode}");
      }
    } catch (e) {
      throw (" failed $e ");
    }
  }

  @override
  void dispose() {
    super.dispose();
    getadd_screen_service(ownerid: "", screenno: "", rows: "", columns: "");
  }

  @override
  void onInit() {
    super.onInit();
    getadd_screen_service(ownerid: "", screenno: "", rows: "", columns: "");
  }
}
