// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/core/theme/colors.dart';
import 'package:my_actu/features/commun/domain/entities/country.dart';
import 'package:my_actu/features/commun/presentation/controllers/all_controller.dart';
import 'package:my_actu/features/commun/presentation/widgets/display_form_field.dart';
import 'package:my_actu/features/commun/presentation/widgets/display_text_button.dart';
import 'package:my_actu/features/commun/presentation/widgets/sheet_container.dart';

final AllController allController = Get.find();

class SearchFilterRowWidget extends StatelessWidget {
  const SearchFilterRowWidget({super.key});

  @override
  Container build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: DisplayFormField(
              context: context,
              radius: 30,
              // margin: EdgeInsets.zero,
              contentPadding: const EdgeInsets.all(15),
              hintText: "Rechercher ",
              prefixIconInSvg: 'assets/icons/svg/search.svg',

              borderColor: Colors.transparent,
              //controller: mailboxController.messageTextInput,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: IconButton.filled(
              constraints: BoxConstraints.expand(),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.lightGray),
              ),
              color: AppColors.lightGray,
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: AppColors.white,
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (_) {
                      return DraggableScrollableSheet(
                          initialChildSize: .75,
                          maxChildSize: 1,
                          minChildSize: .3,
                          expand: false,
                          builder:
                              (context, ScrollController scrollController) {
                            return SheetContainer(
                                containerWidth: width,
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Liste des pays',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.darkMallow,
                                                  ),
                                                ),
                                              ),
                                              Obx(() {
                                                return (allController
                                                        .countriesListFiltered
                                                        .isEmpty)
                                                    ? SizedBox.shrink()
                                                    : DisplayTextButton(
                                                        text: 'Tout supprimer',
                                                        textSize: 12,
                                                        spaceBetween: 5,
                                                        suffixIcon:
                                                            CircleAvatar(
                                                          child: Icon(
                                                            Icons.close_rounded,
                                                            size: 12,
                                                          ),
                                                        ),
                                                        textColor:
                                                            AppColors.red,
                                                        onTap: () =>
                                                            allController
                                                                .onInit());
                                              }),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CountriesGridViewList(
                                              heightContainer: 60,
                                              title: "Amerique",
                                              countries: allController
                                                  .americaCountriesList),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CountriesGridViewList(
                                              heightContainer: 60,
                                              title: "Afrique",
                                              countries: allController
                                                  .africaCountriesList),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CountriesGridViewList(
                                              heightContainer: 250,
                                              title: "Europe",
                                              countries: allController
                                                  .europeCountriesList),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CountriesGridViewList(
                                              heightContainer: 150,
                                              title: "Asie",
                                              countries: allController
                                                  .asiaCountriesList),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )),
                                ));
                          });
                    });
              },
              icon: SvgPicture.asset(
                'assets/icons/svg/menu.svg',
                height: 16,
                /*  colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ), */
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountriesGridViewList extends StatelessWidget {
  final String title;
  final RxList<Country> countries;
  final double heightContainer;
  const CountriesGridViewList({
    Key? key,
    required this.title,
    required this.countries,
    required this.heightContainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width,
            height: heightContainer,
            //color: Colors.amber,
            child: GridView.count(
              padding: EdgeInsets.zero,
              childAspectRatio: 5,
              //  physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4, //crossAxisCount,
              mainAxisSpacing: 20,
              crossAxisSpacing: 0,
              // scrollDirection: Axis.hoverizontal,
              children: countries
                  .asMap()
                  .entries
                  .map(
                    (e) => DisplayTextButton(
                        text: e.value.name,
                        textSize: 10,
                        backgroundColor: e.value.colors!.first,
                        textColor: e.value.colors![1],
                        onTap: () => allController.filterByCountry(
                            e.value.name, title.toLowerCase())),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    });
  }
}

/* extension StringExt on String{
    String toIntOr0() => 'Amérique'?'amerique':('Afrique'?'afrique');

}  */