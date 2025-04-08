import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:owner/constants/token.dart';
import 'package:owner/utils/colors/colors.dart';

import 'package:owner/view/screens/Authentication/reg&otp/logorReg.dart';
import 'package:owner/view/screens/Home/routescreen.dart';
import 'package:sizer/sizer.dart';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getsplash();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///final spla = Get.to(() => splash());

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset("images/netflix.jpg"),
              Image.asset("images/netflix.jpg"),
              Image.asset("images/netflix.jpg"),
              SizedBox(
                  width: 200.w,
                  height: 18.h,
                  child: Image.asset(
                    "images/netflix.jpg",
                    fit: BoxFit.fill,
                  )),
            ],
          ),
          Positioned(
            //  top: 20.h,

            child: Container(
              height: 100.h,
              width: 100.w,
              color: const Color.fromARGB(119, 0, 0, 0),
              child: Center(
                  child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText("MDX MOVIE-SHOW",
                      textStyle: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.bold),
                      colors: [wh, pp, re, yl, wh, pp, blu, bl],
                      speed: const Duration(seconds: 2))
                ],
                isRepeatingAnimation: true,
              )),
            ),
          )
        ],
      ),
    ));
  }

  Future<void> getsplash() async {
    // ignore: prefer_const_constructors, unnecessary_new
    final st = new FlutterSecureStorage();
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 5));
    if (await st.read(key: loacalemail) == null ||
        await st.read(key: loacalpass) == null ||
        await st.read(key: newtokens) == null)
      // ignore: curly_braces_in_flow_control_structures, prefer_const_constructors
      Get.to(() => logorReg());
    else {
      Get.to(() => routescreen());
    }
  }
}
