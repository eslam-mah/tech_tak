import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/generated/l10n.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    switch (RM.data.deviceType) {
      case DeviceTypeView.mobile || DeviceTypeView.tablet:
        return _ContactUsWidgetMobile();
      case DeviceTypeView.desktop:
        return _ContactUsWidgetWeb();
      default:
        return _ContactUsWidgetWeb();
    }
  }
}

class _ContactUsWidgetWeb extends StatelessWidget {
  const _ContactUsWidgetWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? _encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    void sendEmail() async {
      // Replace with your email details
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'techtak@tech-tak.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': 'subject',
          'body': 'body',
        }),
      );

      // Open the email client
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        throw 'Could not launch email client';
      }
    }

    Future<void> _launchUrl(Uri _url) async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Container(
      color: ColorsBox.white,
      height: RM.data.mapSize(mobile: 300, tablet: 250, desktop: 120),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: 10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  S.of(context).contactUs,
                  style: AppTextStyles.regular14()
                      .copyWith(color: ColorsBox.primaryColor),
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 12, tablet: 16, desktop: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ContactDataWidget(
                      onPressed: () async {
                        await _launchUrl(Uri.parse(
                            'https://www.facebook.com/profile.php?id=61571951110762&mibextid=ZbWKwL'));
                      },
                      icon: Image.asset(
                        AssetsBox.facebook,
                        width: RM.data
                            .mapSize(mobile: 12, tablet: 16, desktop: 20),
                        height: RM.data
                            .mapSize(mobile: 12, tablet: 16, desktop: 20),
                      ),
                      title: '/Tech tak - تك تاك',
                    ),
                    SizedBox(
                      width:
                          RM.data.mapSize(mobile: 12, tablet: 16, desktop: 16),
                    ),
                    _ContactDataWidget(
                      onPressed: () async {
                        await _launchUrl(
                            Uri.parse('https://www.instagram.com/techtakx/'));
                      },
                      icon: Image.asset(
                        AssetsBox.instagram,
                        width: RM.data
                            .mapSize(mobile: 12, tablet: 16, desktop: 20),
                        height: RM.data
                            .mapSize(mobile: 12, tablet: 16, desktop: 20),
                      ),
                      title: '/Tech tak - تك تاك',
                    ),
                  ],
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 12, tablet: 16, desktop: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ContactDataWidget(
                      onPressed: sendEmail,
                      icon: Icon(
                        Icons.mail,
                        color: ColorsBox.primaryColor,
                        size: RM.data
                            .mapSize(mobile: 12, tablet: 16, desktop: 20),
                      ),
                      title: 'techtak@tech-tak.com',
                    ),
                    SizedBox(
                      width:
                          RM.data.mapSize(mobile: 12, tablet: 16, desktop: 16),
                    ),
                    _ContactDataWidget(
                      onPressed: () {
                        _launchUrl(Uri.parse('https://wa.me/+201044669756'));
                      },
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                        size: RM.data
                            .mapSize(mobile: 12, tablet: 16, desktop: 20),
                      ),
                      title: intl.Intl.getCurrentLocale() == 'ar'
                          ? '201044669756+'
                          : '+201044669756',
                    ),
                  ],
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 12, tablet: 16, desktop: 10),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                AssetsBox.logoPngBlue,
                width: RM.data.mapSize(mobile: 80, tablet: 120, desktop: 130),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ContactUsWidgetMobile extends StatelessWidget {
  const _ContactUsWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? _encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    void sendEmail() async {
      // Replace with your email details
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'techtak@tech-tak.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': 'subject',
          'body': 'body',
        }),
      );

      // Open the email client
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        throw 'Could not launch email client';
      }
    }

    Future<void> _launchUrl(Uri _url) async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Container(
      height: RM.data.mapSize(mobile: 250, tablet: 250, desktop: 0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorsBox.white,
          borderRadius: BorderRadius.circular(
              RM.data.mapSize(mobile: 10, tablet: 10, desktop: 10))),
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: 10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).contactUs,
                  style: AppTextStyles.regular18()
                      .copyWith(color: ColorsBox.primaryColor),
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 12, tablet: 12, desktop: 10),
                ),
                _ContactDataWidget(
                  onPressed: () async {
                    await _launchUrl(Uri.parse(
                        'https://www.facebook.com/profile.php?id=61571951110762&mibextid=ZbWKwL'));
                  },
                  icon: Image.asset(
                    AssetsBox.facebook,
                    width: RM.data.mapSize(mobile: 35, tablet: 35, desktop: 20),
                    height:
                        RM.data.mapSize(mobile: 35, tablet: 35, desktop: 20),
                  ),
                  title: '/Tech tak - تك تاك',
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 5, tablet: 5, desktop: 10),
                ),
                _ContactDataWidget(
                  onPressed: () async {
                    await _launchUrl(
                        Uri.parse('https://www.instagram.com/techtakx/'));
                  },
                  icon: Image.asset(
                    AssetsBox.instagram,
                    width: RM.data.mapSize(mobile: 35, tablet: 35, desktop: 20),
                    height:
                        RM.data.mapSize(mobile: 35, tablet: 35, desktop: 20),
                  ),
                  title: '/Tech tak - تك تاك',
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 5, tablet: 5, desktop: 10),
                ),
                _ContactDataWidget(
                  icon: Icon(
                    Icons.mail,
                    color: ColorsBox.primaryColor,
                    size: RM.data.mapSize(mobile: 35, tablet: 35, desktop: 20),
                  ),
                  title: 'techtak@tech-tak.com',
                  onPressed: sendEmail,
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 5, tablet: 5, desktop: 10),
                ),
                _ContactDataWidget(
                  onPressed: () {
                    _launchUrl(Uri.parse('https://wa.me/+201044669746'));
                  },
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    size: RM.data.mapSize(mobile: 35, tablet: 35, desktop: 20),
                  ),
                  title: intl.Intl.getCurrentLocale() == 'ar'
                      ? '201044669746+'
                      : '+201044669746',
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                AssetsBox.logoPngBlue,
                width: RM.data.mapSize(mobile: 100, tablet: 140, desktop: 130),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ContactDataWidget extends StatelessWidget {
  final Function() onPressed;
  final Widget icon;
  final String title;
  const _ContactDataWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: RM.data.mapSize(mobile: 5, tablet: 7, desktop: 7),
          ),
          Text(
            title,
            style: RM.data.deviceType == DeviceTypeView.desktop
                ? AppTextStyles.regular10()
                    .copyWith(color: ColorsBox.primaryColor)
                : AppTextStyles.medium16()
                    .copyWith(color: ColorsBox.primaryColor),
          ),
        ],
      ),
    );
  }
}
