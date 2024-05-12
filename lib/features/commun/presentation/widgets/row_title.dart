import 'package:flutter/material.dart';
import 'package:my_actu/core/theme/styles.dart';

class RowTitleSection extends StatelessWidget {
  final String title;
  const RowTitleSection({super.key, required this.title});

  @override
  Row build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyle().titleTextStyle(),
        ),
        Text('Voir tout', style: AppStyle().tinyLabelStyle())
      ],
    );
  }
}
