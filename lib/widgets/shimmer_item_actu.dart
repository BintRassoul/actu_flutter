import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerActuItem(double widthCard) {
  return Shimmer.fromColors(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              width: widthCard,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //boxShadow: [ shadow ],
                color: Colors.white,
                /* boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 9,
                        offset: Offset(0, 3))
                   ]*/
              ),
            );
          }),
      baseColor: Color.fromARGB(255, 235, 235, 235),
      highlightColor: Colors.grey[100]!);
}
