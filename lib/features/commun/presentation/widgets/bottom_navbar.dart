import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_actu/core/theme/styles.dart';
import 'package:my_actu/features/commun/presentation/controllers/all_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  @override
  Container build(BuildContext context) {
    final AllController allController = Get.put(AllController());

    return Container(
      height: 100,
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.17),
            blurRadius: 10,
          ),
        ],
      ),
      child: Obx(
        () {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // selectedItemColor: allController.getTabIndexColor(),
            unselectedLabelStyle: AppStyle().unselectedLabelStyle(),
            selectedLabelStyle: AppStyle().selectedLabelStyle(),
            onTap: allController.changeTabIndex,
            currentIndex: allController.tabIndex.value,
            enableFeedback: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/svg/home.svg",
                  colorFilter: ColorFilter.mode(
                    allController.getTabIndexColor(inputIndex: 0),
                    BlendMode.srcIn,
                  ),
                  height: 22,
                ),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/svg/bookmark.svg",
                  colorFilter: ColorFilter.mode(
                    allController.getTabIndexColor(inputIndex: 1),
                    BlendMode.srcIn,
                  ),
                  height: 20,
                ),
                label: 'Favoris',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/svg/flow.svg",
                  colorFilter: ColorFilter.mode(
                    allController.getTabIndexColor(inputIndex: 2),
                    BlendMode.srcIn,
                  ),
                  height: 20,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/svg/setting.svg",
                  height: 22,
                  colorFilter: ColorFilter.mode(
                    allController.getTabIndexColor(inputIndex: 3),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Parametres',
              ),
            ],
          );
        },
      ),
    );
  }
}
