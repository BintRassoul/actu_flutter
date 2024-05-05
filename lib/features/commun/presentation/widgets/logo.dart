import 'package:flutter/material.dart';
import 'package:my_actu/constants/app_constants.dart';

class LogoApp extends StatelessWidget {
  final bool isWithDate;
  const LogoApp({super.key, this.isWithDate = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: width,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            left: 8.22,
            top: 0,
            child: SizedBox(
              child: Text(
                'TopActu',
                style: TextStyle(
                  color: Color(0xFF5C1688),
                  fontSize: 14,
                  fontFamily: 'Bruno Ace',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.84,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 12,
            child: Container(
              width: 7,
              height: 7,
              decoration: ShapeDecoration(
                color: Color(0xFF5C1688),
                shape: OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
