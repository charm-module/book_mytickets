// ignore_for_file: void_checks, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner/controller/storage.dart';

import 'package:owner/service/addshowservice/addshowservice.dart';
import 'package:owner/service/allbookingdatas/bookingdetails_service.dart';
import 'package:owner/service/currentowner/currentownerservice.dart';
import 'package:owner/service/dashboard/allsailservice.dart';
import 'package:owner/service/get-shows/getshows.dart';
import 'package:owner/service/getcurrentscreens/screen_service.dart';
import 'package:owner/service/movies/movies_service.dart';
import 'package:owner/service/owners/authentication/login.dart';
import 'package:owner/splashscreen/splashscreen.dart';
import 'package:sizer/sizer.dart';

import 'service/owners/authentication/register.dart';

void main() {
  runApp(const MyApp());
}

final monthsail = Get.put(get_monthyly_sails());

final addshowstointernet = Get.put(addshows_service());
final logdata = Get.put(loginService());

final moviedata = Get.put(get_movies_controller());
final showadds = Get.to(addshows_service());
final ownerids = Get.put(get_current_owner());
final bookingdatas = Get.put(get_booking_details());
final showdata = Get.put(getshows_service());
final screemanagedata = Get.put(get_current_screens());
final localstore = Get.put(localstorage());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: SplashScreen(),
        ),
        initialBinding: BindingsBuilder(() => Get.put(registerService())),
      );
    });
  }
}
