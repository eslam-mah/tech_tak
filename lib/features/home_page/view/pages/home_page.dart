import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/about_us/view/about_us_page.dart';
import 'package:tech_tak/features/about_us/view/widgets/contact_us_widget.dart';
import 'package:tech_tak/features/booking_page/view/pages/booking_page.dart';
import 'package:tech_tak/features/home_page/view/widgets/animation_on_scroll.dart';
import 'package:tech_tak/features/home_page/view/widgets/description_widget.dart';
import 'package:tech_tak/features/home_page/view/widgets/home_slider.dart';
import 'package:tech_tak/features/home_page/view/widgets/language_button.dart';
import 'package:tech_tak/features/home_page/view/widgets/logo_widget.dart';
import 'package:tech_tak/features/projects_page/view/views/projects_page.dart';
import 'package:tech_tak/generated/l10n.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isScrolled = false;
  final double scrollThreshold = 50.0;

  void _onScroll(double offset) {
    if (!_isScrolled && offset > scrollThreshold) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_isScrolled && offset <= scrollThreshold) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    // Determine the colors based on whether the page is scrolled.
    final appBarBackgroundColor =
        _isScrolled ? ColorsBox.primaryColor2 : Colors.white;
    final textColor = _isScrolled ? Colors.white : ColorsBox.primaryColor;
    final languageIconColor =
        _isScrolled ? Colors.white : ColorsBox.primaryColor2;
    final languageBoxColor =
        _isScrolled ? ColorsBox.primaryColor2 : Colors.white;
    final logo = _isScrolled ? AssetsBox.logoPngWhite : AssetsBox.logoPngBlue;

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: ColorsBox.primaryColor2,
            height: 1,
          ),
        ),
        centerTitle: false,
        backgroundColor: appBarBackgroundColor,
        // Removed the fixed foregroundColor so that our text styles take effect.
        surfaceTintColor: Colors.white,

        title: LogoWidget(
          logo: logo,
        ),
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
                  style: AppTextStyles.regular10().copyWith(color: textColor),
                ),
              ),
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
                    style: AppTextStyles.regular10().copyWith(color: textColor),
                  ),
                ),
                SizedBox(
                  width: RM.data.mapSize(mobile: 5, tablet: 10, desktop: 10),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(BookingPage.routeName);
                  },
                  child: Text(
                    S.of(context).bookNow,
                    style: AppTextStyles.regular10().copyWith(color: textColor),
                  ),
                ),
              ],
              SizedBox(
                width: RM.data.mapSize(mobile: 5, tablet: 10, desktop: 10),
              ),
              LanguageButton(
                iconColor: languageIconColor,
                boxColor: languageBoxColor,
              ),
            ],
          )
        ],
      ),
      backgroundColor: ColorsBox.greyBody,
      // Only listen to the primary scroll view notifications (depth == 0)
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.depth == 0 &&
              notification is ScrollUpdateNotification) {
            _onScroll(notification.metrics.pixels);
          }
          return true;
        },
        child: ScrollConfiguration(
          behavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: RM.data.mapSize(
                      mobile: MediaQuery.of(context).size.width * 0.01,
                      tablet: MediaQuery.of(context).size.width * 0.01,
                      desktop: MediaQuery.of(context).size.width * 0.05,
                    ),
                    right: RM.data.mapSize(
                      mobile: MediaQuery.of(context).size.width * 0.01,
                      tablet: MediaQuery.of(context).size.width * 0.01,
                      desktop: MediaQuery.of(context).size.width * 0.05,
                    ),
                    top: RM.data.deviceType == DeviceTypeView.mobile ||
                            RM.data.deviceType == DeviceTypeView.tablet
                        ? MediaQuery.of(context).size.height * 0.07
                        : MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: const HomeSlider(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: RM.data.mapSize(
                      mobile: MediaQuery.of(context).size.width * 0.01,
                      tablet: MediaQuery.of(context).size.width * 0.01,
                      desktop: MediaQuery.of(context).size.width * 0.05,
                    ),
                    right: RM.data.mapSize(
                      mobile: MediaQuery.of(context).size.width * 0.01,
                      tablet: MediaQuery.of(context).size.width * 0.01,
                      desktop: MediaQuery.of(context).size.width * 0.05,
                    ),
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
