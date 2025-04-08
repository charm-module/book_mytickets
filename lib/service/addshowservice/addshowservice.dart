// ignore_for_file: unused_local_variable, camel_case_types, use_build_context_synchronously, unrelated_type_equality_checks

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owner/constants/endpoints/endpoint.dart';
import 'package:owner/constants/token.dart';
import 'package:owner/view/screens/screenManagement/widgets/dialog.dart';
import 'package:owner/view/screens/showList/showlist.dart';

class addshows_service extends GetxController {
  var isLoading = false.obs;

  // ignore: non_constant_identifier_names
  get_addshows(
      {required var owner,
      required var movie,
      required var time,
      required var startdate,
      required var enddate,
      required var price,
      required BuildContext context,
      required var screen}) async {
         final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);
    final bdy = {
      "owner": {"_id": owner.toString()},
      "screen": screen.toString(),
      "inputValue": movie.toString(),
      "time": time.toString(),
      "startDate": startdate.toString(),
      "endDate": enddate.toString(),
      "price": price.toString(),
    };

    try {
      end e = end();
      final response = await http.post(Uri.parse(e.addshow_url),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $sr'
          },
          body: jsonEncode(bdy));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // ignore: avoid_print
        print(data.toString());
        // ignore: prefer_const_constructors
        Get.to(() => showlist());
        if (response.body == 409) {
          reawsome(
              context: context,
              txt: "alredy exist",
              des: "show is alredy exist ",
              Type: DialogType.INFO);
        }
        return data;
      } else {
        throw ("the data not added the database ");
      }
    } catch (e) {
      throw ("its failed $e");
    }
  }

  // ignore: non_constant_identifier_names
  get_delete_show({required var idt, required BuildContext context}) async {
    final bdy = {
      "showId": idt.toString(),
    };

    try {
      end e = end();
      final response = await http.post(Uri.parse(e.deleteshow_url),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(bdy));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // ignore: avoid_print
        print(data.toString());
        reawsome(
            context: context,
            txt: "Sucess",
            des: "Deleted Sucessfully",
            Type: DialogType.SUCCES);

        // ignore: prefer_const_constructors
        Get.to(() => showlist());
        if (response.statusCode == 400) {
          reawsome(
              context: context,
              txt: "invalid Id",
              des: "invalid Id",
              Type: DialogType.ERROR);
          update();
        }
        // if (response.body == 409) {
        //   // reawsome(
        //   //     context: context,
        //   //     txt: "alredy exist",
        //   //     des: "show is alredy exist ",
        //   //     Type: DialogType.INFO);
        // }
        return data;
      } else {
        throw ("the data is not deleted");
      }
    } catch (e) {
      throw ("its failed $e");
    }
  }
}
