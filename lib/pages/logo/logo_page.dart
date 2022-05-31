import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:shimmer/shimmer.dart';

import '../home/home_page.dart';

class LogoPage extends StatelessWidget {
  //const LogoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 4000,
        splash: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/actu.png',
                  width: 150,
                )),
            Expanded(
              child: const Text(
                'ActuMonde',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
        splashIconSize: 200,
        nextScreen: HomePage(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: mainHexColor);
  }
}
