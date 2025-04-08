import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owner/constants/endpoints/endpoint.dart';
import 'package:owner/constants/token.dart';
import 'package:owner/models/owner/ownerdetailsmodel/currecntowner.dart';

dynamic jwt;

// ignore: camel_case_types
class get_current_owner extends GetxController {
  var isLoading = false.obs;
  var dataList = <Currentowner10>[].obs;

  late Currentowner10 reply;

  getrealowner() async {
    // ignore: prefer_const_constructors
    final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);
    try {
      isLoading(true);
      end j = end();
      final response = await http.get(Uri.parse(j.current_owner_url), headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $sr'
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        reply = Currentowner10.fromJson(data);

        /// dataList.value.add(reply);

        print(
            "<----------1233-----------------------${dataList}-----------123-------------->");

        //  reply = Currentowner10.fromJson(data);
        print(
            "-<------------------------${reply.data.adhaar.toString()}------------------------->-");
        isLoading(false);
        update();

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
    getrealowner();
  }
}
