import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/core/widgets/custom_primary_button.dart';
import 'package:tech_tak/features/booking_page/view/pages/booking_page.dart';
import 'package:tech_tak/features/projects_page/view/views/projects_page.dart';
import 'package:tech_tak/generated/l10n.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    switch (RM.data.deviceType) {
      case DeviceTypeView.mobile:
        return const _HomeSliderMobile();
      case DeviceTypeView.tablet:
        return const _HomeSliderMobile();
      case DeviceTypeView.desktop:
        return const _HomeSliderWeb();
      default:
        return const _HomeSliderWeb();
    }
  }
}

class _HomeSliderWeb extends StatefulWidget {
  const _HomeSliderWeb({super.key});

  @override
  State<_HomeSliderWeb> createState() => _HomeSliderWebState();
}

class _HomeSliderWebState extends State<_HomeSliderWeb> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final images = [
      AssetsBox.banner2,
      AssetsBox.bannerMobile2,
      AssetsBox.bannerWeb
    ];

    final slogans = [
      S.of(context).slogan4,
      S.of(context).slogan2,
      S.of(context).slogan3,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _TextSliderWidget(slogans: slogans, currentIndex: _currentIndex),
          SizedBox(
            width: RM.data.mapSize(mobile: 200, tablet: 300, desktop: 250),
          ),
          Expanded(
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                final image = images[index];
                return Image.asset(
                  image,
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                aspectRatio: 2.72,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex =
                        index; // Update current index on slide change
                  });
                },
              ),
            ),
          ),
        ]),
        SizedBox(
          height: RM.data.mapSize(mobile: 0, tablet: 0, desktop: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrimaryButton(
              onPressed: () {
                GoRouter.of(context).push(ProjectsPage.routeName);
              },
              title: S.of(context).ourProjects,
              buttonHeight: RM.data.mapSize(mobile: 0, tablet: 0, desktop: 50),
              buttonWidth: RM.data.mapSize(mobile: 0, tablet: 0, desktop: 140),
            ),
            SizedBox(
              width: RM.data.mapSize(mobile: 0, tablet: 0, desktop: 80),
            ),
            CustomPrimaryButton(
              onPressed: () {
                GoRouter.of(context).push(BookingPage.routeName);
              },
              title: S.of(context).bookNow,
              buttonHeight: RM.data.mapSize(mobile: 0, tablet: 0, desktop: 50),
              buttonWidth: RM.data.mapSize(mobile: 0, tablet: 0, desktop: 140),
            ),
          ],
        ),
        SizedBox(
          height: RM.data.mapSize(mobile: 0, tablet: 0, desktop: 20),
        ),
      ],
    );
  }
}

class _HomeSliderMobile extends StatefulWidget {
  const _HomeSliderMobile({super.key});

  @override
  State<_HomeSliderMobile> createState() => _HomeSliderMobileState();
}

class _HomeSliderMobileState extends State<_HomeSliderMobile> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final images = [
      AssetsBox.banner2,
      AssetsBox.bannerMobile2,
      AssetsBox.bannerWeb
    ];

    final slogans = [
      S.of(context).slogan4,
      S.of(context).slogan2,
      S.of(context).slogan3,
    ];

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              final image = images[index];
              return Image.asset(
                image,
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              aspectRatio: 2.9,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: RM.data.mapSize(mobile: 80, tablet: 80, desktop: 0),
          ),
          _TextSliderWidget(slogans: slogans, currentIndex: _currentIndex),
          SizedBox(
            height: RM.data.mapSize(mobile: 80, tablet: 80, desktop: 0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomPrimaryButton(
                onPressed: () {
                  GoRouter.of(context).push(BookingPage.routeName);
                },
                title: S.of(context).bookNow,
                buttonHeight:
                    RM.data.mapSize(mobile: 40, tablet: 50, desktop: 0),
                buttonWidth:
                    RM.data.mapSize(mobile: 90, tablet: 100, desktop: 0),
              ),
              CustomPrimaryButton(
                onPressed: () {
                  GoRouter.of(context).push(ProjectsPage.routeName);
                },
                title: S.of(context).ourProjects,
                buttonHeight:
                    RM.data.mapSize(mobile: 40, tablet: 50, desktop: 0),
                buttonWidth:
                    RM.data.mapSize(mobile: 90, tablet: 100, desktop: 0),
              ),
            ],
          ),
          SizedBox(
            height: RM.data.mapSize(mobile: 20, tablet: 20, desktop: 0),
          ),
        ]);
  }
}

class _TextSliderWidget extends StatelessWidget {
  const _TextSliderWidget({
    super.key,
    required this.slogans,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final List<String> slogans;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: RM.data.mapSize(mobile: 250, tablet: 350, desktop: 500),
      child: Text(
        slogans[_currentIndex],
        textAlign: RM.data.deviceType == DeviceTypeView.mobile ||
                RM.data.deviceType == DeviceTypeView.tablet
            ? TextAlign.center
            : TextAlign.start,
        style: AppTextStyles.bold34().copyWith(color: ColorsBox.primaryColor),
      ),
    );
  }
}
