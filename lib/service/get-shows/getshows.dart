// ignore_for_file: unrelated_type_equality_checks, camel_case_types, unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owner/constants/endpoints/endpoint.dart';
import 'package:owner/constants/token.dart';
import 'package:owner/models/owner/allshows10/allshow10model.dart';
import 'package:owner/view/screens/screenManagement/widgets/dialog.dart';

class getshows_service extends GetxController {
  var isLoading = false.obs;

 late Allshows10 reply;
  var dataList = <Allshows10>[].obs;
  Future getshows({required var id, BuildContext? context}) async {
    final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);
    // ignore: unused_local_variable
    end e = end();

    try {
      isLoading.value = true;

      final response = await http.get(
          Uri.parse(
              "https://bookmyscreen.onrender.com/owner/get-shows/${id.toString()}"),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $sr'
          });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        reply = Allshows10.fromJson(data);

        /// dataList.value.assign(repl);

        print(dataList.map((element) =>
            element.data.map((e) => e.movieName.toString()).toList()));

        print(
            "<-------------happy-----------reply-------------${dataList.map((element) => element.data.map((e) => e.movieName.toString()).toList())}------------reply----------happy----------------------->");

        isLoading.value = false;

        update();

        if (response.statusCode == 400) {
          // ignore: use_build_context_synchronously
          reawsome(
              context: context!,
              txt: "invalid Id",
              des: "invalid Id",
              Type: DialogType.ERROR);
          update();
        }
        return reply;
      } else {
        isLoading.value = false;

        throw ("is failed fetching the data");
      }
    } catch (e) {
      throw ("is failed fetching the data$e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getshows(id: "");
    refresh();
  }
}
