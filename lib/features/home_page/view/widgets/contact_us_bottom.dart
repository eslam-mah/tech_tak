import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/generated/l10n.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

class ContactUsBottomPage extends StatelessWidget {
  const ContactUsBottomPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    switch (RM.data.deviceType) {
      case DeviceTypeView.mobile || DeviceTypeView.tablet:
        return _ContactUsMobile();
      case DeviceTypeView.desktop:
        return _ContactUsWeb();
      default:
        return _ContactUsWeb();
    }
  }
}

class _ContactUsWeb extends StatelessWidget {
  const _ContactUsWeb({
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

    void _sendEmail() async {
      // Replace with your email details
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'example@gmail.com', // Replace with the recipient's email
        query: _encodeQueryParameters(<String, String>{
          'subject': 'Hello from Flutter',
          'body': 'This is a test email sent from my Flutter app.',
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
      color: ColorsBox.primaryColor,
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
                      .copyWith(color: ColorsBox.white),
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
                      onPressed: () {
                        _sendEmail;
                      },
                      icon: Icon(
                        Icons.mail,
                        color: ColorsBox.white,
                        size: RM.data
                            .mapSize(mobile: 12, tablet: 16, desktop: 20),
                      ),
                      title: 'techtakxpage@gmail.com',
                    ),
                    SizedBox(
                      width:
                          RM.data.mapSize(mobile: 12, tablet: 16, desktop: 16),
                    ),
                    _ContactDataWidget(
                      onPressed: () {
                        _launchUrl(Uri.parse('https://wa.me/+201147829502'));
                      },
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                        size: RM.data
                            .mapSize(mobile: 12, tablet: 16, desktop: 20),
                      ),
                      title: intl.Intl.getCurrentLocale() == 'ar'
                          ? '201147829502+'
                          : '+201147829502',
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
                AssetsBox.logoPngWhite,
                width: RM.data.mapSize(mobile: 80, tablet: 120, desktop: 130),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ContactUsMobile extends StatelessWidget {
  const _ContactUsMobile({
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

    void _sendEmail() async {
      // Replace with your email details
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'example@gmail.com', // Replace with the recipient's email
        query: _encodeQueryParameters(<String, String>{
          'subject': 'Hello from Flutter',
          'body': 'This is a test email sent from my Flutter app.',
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
          color: ColorsBox.primaryColor,
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
                      .copyWith(color: ColorsBox.white),
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
                  onPressed: () async {
                    _sendEmail;
                  },
                  icon: Icon(
                    Icons.mail,
                    color: ColorsBox.white,
                    size: RM.data.mapSize(mobile: 35, tablet: 35, desktop: 20),
                  ),
                  title: 'techtakxpage@gmail.com',
                ),
                SizedBox(
                  height: RM.data.mapSize(mobile: 5, tablet: 5, desktop: 10),
                ),
                _ContactDataWidget(
                  onPressed: () {
                    _launchUrl(Uri.parse('https://wa.me/+201147829502'));
                  },
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    size: RM.data.mapSize(mobile: 35, tablet: 35, desktop: 20),
                  ),
                  title: intl.Intl.getCurrentLocale() == 'ar'
                      ? '201147829502+'
                      : '+201147829502',
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                AssetsBox.logoPngWhite,
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
                ? AppTextStyles.regular10().copyWith(color: ColorsBox.white)
                : AppTextStyles.medium16().copyWith(color: ColorsBox.white),
          ),
        ],
      ),
    );
  }
}
