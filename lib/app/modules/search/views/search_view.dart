import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchingController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Stack(
        children: [
          // Container(
          //   color: Colors.red[100],
          // ),
          Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                80.kheightBox,
                Row(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'search',
                        child: Material(
                          borderRadius: BorderRadius.circular(8.kh),
                          child: EvStationTextField(
                            prefixIcon: Padding(
                              padding:
                                  EdgeInsets.only(left: 18.kw, right: 21.kw),
                              child: CommonImageView(
                                fit: BoxFit.contain,
                                svgPath: ImageConstant.svgSearch,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: 21.paddingRight,
                              child: GestureDetector(
                                onTap: () {
                                  ///TODO
                                },
                                child: CommonImageView(
                                  height: 24.kh,
                                  width: 24.kh,
                                  svgPath: ImageConstant.svgMicrophone,
                                ),
                              ),
                            ),
                            hintStyle: TextStyleUtil.genSans500(
                                fontSize: 14.kh,
                                color: const Color(0xffa1a1a1)),
                            hint: LocaleKeys.home_search_for_a.tr,
                            textFillColor: const Color(0xffEFEFEF),
                          ),
                        ),
                      ),
                    ),
                    15.kwidthBox,
                    EvStationRoundedBox(
                        height: 36.kh,
                        width: 36.kh,
                        onTap: () => controller.onFilterTap(),
                        child: Padding(
                          padding: 6.paddingAll,
                          child: CommonImageView(
                            height: 24.kh,
                            width: 24.kh,
                            svgPath: ImageConstant.svgFilter,
                          ),
                        ))
                  ],
                ),
                40.kheightBox,
                Expanded(
                  child: ListView.builder(
                      padding: paddingOnly(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              onTap: () => controller.onStationTap(index),
                              title: 'Northampton Station'.text500(14.kh),
                              leading: CommonImageView(
                                height: 30.kh,
                                width: 30.kh,
                                svgPath: ImageConstant.svgElectricRefuel,
                              ),
                              subtitle:
                                  '541, Centric Centre near 51 Avenue metro station'
                                      .text400(12.kh),
                              contentPadding: EdgeInsets.zero,
                            ),
                            Divider(
                              thickness: 0.5.kh,
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
