import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const LogoWidget(),
        actions: const [LanguageButton()],
      ),
      backgroundColor: ColorsBox.greyBody,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                    top: RM.data.deviceType == DeviceTypeView.mobile ||
                            RM.data.deviceType == DeviceTypeView.tablet
                        ? MediaQuery.of(context).size.height * 0.07
                        : MediaQuery.of(context).size.width * 0.03),
                child: const HomeSlider()),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  bottom: RM.data.mapSize(mobile: 20, tablet: 20, desktop: 5)),
              child: const DescriptionWidget(),
            ),
            const ContactUsBottomPage()
          ],
        ),
      ),
    );
  }
}
