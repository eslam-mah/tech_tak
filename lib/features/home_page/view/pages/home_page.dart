import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/home_page/view/widgets/animation_on_scroll.dart';
import 'package:tech_tak/features/home_page/view/widgets/contact_us_bottom.dart';
import 'package:tech_tak/features/home_page/view/widgets/description_widget.dart';
import 'package:tech_tak/features/home_page/view/widgets/home_slider.dart';
import 'package:tech_tak/features/home_page/view/widgets/language_button.dart';
import 'package:tech_tak/features/home_page/view/widgets/logo_widget.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const LogoWidget(),
        actions: const [LanguageButton()],
      ),
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: RM.data.deviceType == DeviceTypeView.desktop
                  ? const AssetImage(AssetsBox.backgroundWhite)
                  : const AssetImage(AssetsBox.backgroundMobileWhite),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Wrap the HomeSlider widget in AnimatedOnScroll.
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                    top: RM.data.deviceType == DeviceTypeView.mobile ||
                            RM.data.deviceType == DeviceTypeView.tablet
                        ? MediaQuery.of(context).size.height * 0.07
                        : MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: const HomeSlider(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                    bottom: RM.data.mapSize(mobile: 20, tablet: 20, desktop: 5),
                  ),
                  child: const DescriptionWidget(),
                ),
                const AnimatedOnScroll(
                  delay: Duration(milliseconds: 100),
                  child: ContactUsBottomPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
