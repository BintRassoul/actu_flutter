import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/core/theme/styles.dart';
import 'package:my_actu/features/commun/presentation/widgets/display_text_button.dart';

class RowTitleSection extends StatelessWidget {
  final String title;
  final String route;
  const RowTitleSection({super.key, required this.title, required this.route});

  @override
  Row build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyle().titleTextStyle(),
        ),
        DisplayTextButton(
          text: 'Voir tout',
          onTap: () => Get.toNamed(route),
        )
      ],
    );
  }
}
