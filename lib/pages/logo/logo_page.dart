import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:shimmer/shimmer.dart';

import '../home/home_page.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    await 5.delay(() => Get.off(() => HomePage()));
    // var duration = new Duration(seconds: 5);
    //return new Timer(await 3.delay(), () => Get.off(HomePage()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.17, 0.28),
                end: Alignment.topRight,
                colors: [
                  mainHexColor.withOpacity(0.89),
                  const Color(0xFF120CB6).withOpacity(0.81),
                  const Color(0xFF120CB6).withOpacity(0.81),
                  const Color(0xFF100BA3).withOpacity(0.8),
                  const Color(0xFF0E0A8C).withOpacity(0.85),
                  const Color(0xFF0B086C).withOpacity(0.79),
                  const Color(0xFF0A0762)
                ],
                stops: [0.0, 0.289, 0.339, 0.588, 0.803, 1.0, 1.0],
              ),
            ),
            child: Center(
              child: Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 30, 10, 43),
                highlightColor: Colors.white,
                child: Text(
                  'ActuMonde',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48.0,
                    fontFamily: 'Segoe',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )));
  }
}
