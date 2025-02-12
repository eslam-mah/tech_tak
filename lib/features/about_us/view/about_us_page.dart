import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/about_us/view/widgets/about_us_title_widget.dart';
import 'package:tech_tak/features/about_us/view/widgets/big_logo_widget.dart';
import 'package:tech_tak/features/about_us/view/widgets/contact_us_widget.dart';
import 'package:tech_tak/features/about_us/view/widgets/services_widget.dart';
import 'package:tech_tak/generated/l10n.dart';

class AboutUsPage extends StatelessWidget {
  static String routeName = '/about_us_page';
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
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
                    top: RM.data.deviceType == DeviceTypeView.mobile ||
                            RM.data.deviceType == DeviceTypeView.tablet
                        ? MediaQuery.of(context).size.height * 0.009
                        : MediaQuery.of(context).size.width * 0.009,
                  ),
                  child: const Center(child: BigLogoWidget()),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                    ),
                    child: const AboutUsTitleWidget(),
                  ),
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 30, tablet: 50, desktop: 60),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Text(
                    '${S.of(context).ourServices}:',
                    style: AppTextStyles.bold22()
                        .copyWith(color: ColorsBox.primaryColor),
                  ),
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 15, tablet: 25, desktop: 30),
                ),
                ServicesWidget(
                  title: S.of(context).title1,
                  description: S.of(context).serviceDescription1,
                ),
                ServicesWidget(
                  title: S.of(context).title2,
                  description: S.of(context).serviceDescription2,
                ),
                ServicesWidget(
                  title: S.of(context).title3,
                  description: S.of(context).serviceDescription3,
                ),
                ServicesWidget(
                  title: S.of(context).title4,
                  description: S.of(context).serviceDescription4,
                ),
                ServicesWidget(
                  title: S.of(context).title5,
                  description: S.of(context).serviceDescription5,
                ),
                const ContactUsWidget()
              ],
            ),
          ),
        ));
  }
}
