import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owner/constants/endpoints/endpoint.dart';
import 'package:owner/constants/token.dart';
import 'package:owner/models/owner/movies/movies10.dart';

// ignore: camel_case_types
class get_movies_controller extends GetxController {
  var isLoading = false.obs;
  late Movies10 reply;
  getmovies() async {
    final st = FlutterSecureStorage();

    var sr = await st.read(key: newtokens);
    end e = end();
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse(e.movies_url),
        // ignore: unnecessary_brace_in_string_interps
        headers: {
          // ignore: unnecessary_brace_in_string_interps
          'Authorization': 'Bearer ${sr}',
          'Content-Type': 'application/json;charset=utf-8',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate'
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        reply = Movies10.fromJson(data);

        isLoading.value = false;
        // ignore: avoid_print
        print(data.toString());
        update();

        return reply;
      } else {
        isLoading.value = false;

        throw ("is failed to fetch the movies");
      }
    } catch (e) {
      throw ("movies fetching failed$e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getmovies();
  }

  @override
  void dispose() {
    super.dispose();
    getmovies();
  }
}
