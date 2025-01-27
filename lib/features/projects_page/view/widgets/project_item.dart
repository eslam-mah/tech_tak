import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/projects_page/data/models/projects_model.dart';
import 'package:tech_tak/features/projects_page/view/widgets/download_button.dart';
import 'package:tech_tak/features/projects_page/view/widgets/links_button.dart';
import 'package:tech_tak/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatelessWidget {
  final ProjectsModel project;
  const ProjectItem({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    Locale _locale = Localizations.localeOf(context);
    Future<void> _launchUrl(Uri _url) async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                RM.data.mapSize(mobile: 10, tablet: 12, desktop: 15)),
            topRight: Radius.circular(
                RM.data.mapSize(mobile: 10, tablet: 12, desktop: 15)),
          ),
          child: Container(
            height: RM.data.mapSize(mobile: 250, tablet: 250, desktop: 250),
            width: RM.data.mapSize(mobile: 300, tablet: 300, desktop: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    RM.data.mapSize(mobile: 10, tablet: 12, desktop: 15)),
                topRight: Radius.circular(
                    RM.data.mapSize(mobile: 10, tablet: 12, desktop: 15)),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: project.photoUrl ?? '',
              fit: BoxFit.fill,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsBox.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                  size: RM.data.mapSize(mobile: 40, tablet: 50, desktop: 60),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: RM.data.mapSize(mobile: 120, tablet: 120, desktop: 120),
          width: RM.data.mapSize(mobile: 300, tablet: 300, desktop: 300),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                  RM.data.mapSize(mobile: 10, tablet: 12, desktop: 15)),
              bottomRight: Radius.circular(
                  RM.data.mapSize(mobile: 10, tablet: 12, desktop: 15)),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  _locale.languageCode == 'ar'
                      ? project.nameAr ?? ''
                      : project.nameEn ?? '',
                  style: AppTextStyles.semiBold10()
                      .copyWith(color: ColorsBox.primaryColor)),
              if (project.isMobile ?? false) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DownloadButton(
                      storeName: 'Google Play Store',
                      height:
                          RM.data.mapSize(mobile: 35, tablet: 35, desktop: 35),
                      width: RM.data
                          .mapSize(mobile: 130, tablet: 130, desktop: 130),
                      onPressed: () async {
                        await _launchUrl(
                            Uri.parse(project.googlePlayLink ?? ''));
                      },
                      icon: Icon(
                        FontAwesomeIcons.android,
                        color: Colors.green,
                        size: RM.data
                            .mapSize(mobile: 20, tablet: 20, desktop: 20),
                      ),
                    ),
                    DownloadButton(
                      height:
                          RM.data.mapSize(mobile: 35, tablet: 35, desktop: 35),
                      width: RM.data
                          .mapSize(mobile: 130, tablet: 130, desktop: 130),
                      onPressed: () async {
                        await _launchUrl(Uri.parse(project.appStoreLink ?? ''));
                      },
                      icon: Icon(
                        FontAwesomeIcons.apple,
                        color: Colors.grey,
                        size: RM.data
                            .mapSize(mobile: 20, tablet: 20, desktop: 20),
                      ),
                      storeName: 'Apple Store',
                    ),
                  ],
                ),
              ],
              if (project.isWeb ?? false) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: RM.data
                            .mapSize(mobile: 10, tablet: 10, desktop: 10)),
                    LinksButton(
                      buttonSize:
                          RM.data.mapSize(mobile: 35, tablet: 35, desktop: 35),
                      onPressed: () async {
                        await _launchUrl(Uri.parse(project.webLink ?? ''));
                      },
                      icon: Icon(
                        FontAwesomeIcons.globe,
                        color: Colors.white,
                        size: RM.data
                            .mapSize(mobile: 20, tablet: 20, desktop: 20),
                      ),
                    ),
                    SizedBox(
                        width: RM.data
                            .mapSize(mobile: 10, tablet: 10, desktop: 10)),
                    Text(S.of(context).visitWebsite,
                        style: AppTextStyles.regular12()
                            .copyWith(color: ColorsBox.primaryColor)),
                  ],
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}
