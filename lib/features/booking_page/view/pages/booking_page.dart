import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/booking_page/view/widgets/booking_form.dart';
import 'package:tech_tak/features/booking_page/view/widgets/title_widget.dart';
import 'package:tech_tak/features/home_page/view/widgets/contact_us_bottom.dart';
import 'package:tech_tak/features/home_page/view/widgets/logo_widget.dart';

class BookingPage extends StatelessWidget {
  static String routeName = '/booking_page';
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Center(
              child: GestureDetector(
                  onTap: () => GoRouter.of(context).go('/'),
                  child: const LogoWidget())),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: ColorsBox.white,
        body: ScrollConfiguration(
          behavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: RM.data.deviceType == DeviceTypeView.mobile ||
                              RM.data.deviceType == DeviceTypeView.tablet
                          ? MediaQuery.of(context).size.height * 0.05
                          : MediaQuery.of(context).size.width * 0.03,
                      bottom:
                          RM.data.mapSize(mobile: 10, tablet: 10, desktop: 15)),
                  child: const TitleWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: const BookingForm(),
                ),
                RM.data.deviceType == DeviceTypeView.mobile ||
                        RM.data.deviceType == DeviceTypeView.tablet
                    ? Container()
                    : const ContactUsBottomPage(),
              ],
            ),
          ),
        ));
  }
}
