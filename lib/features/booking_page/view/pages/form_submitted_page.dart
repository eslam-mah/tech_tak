import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/core/widgets/custom_primary_button.dart';
import 'package:tech_tak/features/booking_page/view/widgets/submitted_widget.dart';
import 'package:tech_tak/features/home_page/view/widgets/contact_us_bottom.dart';
import 'package:tech_tak/features/home_page/view/widgets/logo_widget.dart';
import 'package:tech_tak/generated/l10n.dart';

class FormSubmittedPage extends StatelessWidget {
  static String routeName = '/form_submitted_page';
  const FormSubmittedPage({super.key});

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
        backgroundColor: ColorsBox.greyBody,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: MediaQuery.of(context).size.width * 0.05,
                          top: RM.data.deviceType == DeviceTypeView.mobile ||
                                  RM.data.deviceType == DeviceTypeView.tablet
                              ? MediaQuery.of(context).size.height * 0.05
                              : MediaQuery.of(context).size.width * 0.03,
                          bottom: RM.data
                              .mapSize(mobile: 10, tablet: 10, desktop: 15)),
                      child: Center(
                        child: Icon(
                          Icons.verified,
                          size: RM.data.mapSize(
                              mobile: 150,
                              tablet: 180,
                              largerTablet: 200,
                              desktop: 250),
                          color: ColorsBox.primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: MediaQuery.of(context).size.width * 0.05,
                          bottom: RM.data
                              .mapSize(mobile: 10, tablet: 10, desktop: 15)),
                      child: const SubmittedWidget(),
                    ),
                    CustomPrimaryButton(
                      onPressed: () {
                        GoRouter.of(context).go('/');
                      },
                      title: S.of(context).backHome,
                      buttonHeight:
                          RM.data.mapSize(mobile: 40, tablet: 50, desktop: 60),
                      buttonWidth: RM.data
                          .mapSize(mobile: 150, tablet: 200, desktop: 250),
                    )
                  ],
                ),
              ),
            ),
            RM.data.deviceType == DeviceTypeView.mobile ||
                    RM.data.deviceType == DeviceTypeView.tablet
                ? Container()
                : const ContactUsBottomPage(),
          ],
        ));
  }
}
