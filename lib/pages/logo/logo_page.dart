import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_actu/features/home/presentation/pages/home_page.dart';

import '../../constants/app_constants.dart';

class LogoPage extends StatelessWidget {
  //const LogoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/worldwide.png',
              width: .27 * width,
              height: .13 * height,
              //fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Text(
                'TopActu',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Bruno Ace",
                    color: whiteColor),
              ),
            )
          ],
        ),
        splashIconSize: 300,
        nextScreen: HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: mainHexColor);
  }
}
