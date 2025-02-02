import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/about_us/view/about_us_page.dart';
import 'package:tech_tak/features/about_us/view/widgets/contact_us_widget.dart';
import 'package:tech_tak/features/booking_page/view/pages/booking_page.dart';
import 'package:tech_tak/features/home_page/view/widgets/animation_on_scroll.dart';
import 'package:tech_tak/features/home_page/view/widgets/contact_us_bottom.dart';
import 'package:tech_tak/features/home_page/view/widgets/description_widget.dart';
import 'package:tech_tak/features/home_page/view/widgets/home_slider.dart';
import 'package:tech_tak/features/home_page/view/widgets/language_button.dart';
import 'package:tech_tak/features/home_page/view/widgets/logo_widget.dart';
import 'package:tech_tak/features/projects_page/view/views/projects_page.dart';
import 'package:tech_tak/generated/l10n.dart';

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
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: RM.data.mapSize(mobile: 5, tablet: 10, desktop: 10),
              ),
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AboutUsPage.routeName);
                  },
                  child: Text(
                    S.of(context).aboutUs,
                    style: AppTextStyles.regular10()
                        .copyWith(color: ColorsBox.primaryColor),
                  )),
              if (RM.data.deviceType == DeviceTypeView.desktop ||
                  RM.data.deviceType == DeviceTypeView.tablet) ...[
                SizedBox(
                  width: RM.data.mapSize(mobile: 5, tablet: 10, desktop: 10),
                ),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(ProjectsPage.routeName);
                    },
                    child: Text(
                      S.of(context).ourProjects,
                      style: AppTextStyles.regular10()
                          .copyWith(color: ColorsBox.primaryColor),
                    )),
                SizedBox(
                  width: RM.data.mapSize(mobile: 5, tablet: 10, desktop: 10),
                ),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(BookingPage.routeName);
                    },
                    child: Text(
                      S.of(context).bookNow,
                      style: AppTextStyles.regular10()
                          .copyWith(color: ColorsBox.primaryColor),
                    )),
              ],
              SizedBox(
                width: RM.data.mapSize(mobile: 5, tablet: 10, desktop: 10),
              ),
              const LanguageButton(),
            ],
          )
        ],
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
                  child: ContactUsWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
