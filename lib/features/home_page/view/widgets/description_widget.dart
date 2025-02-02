import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/home_page/view/widgets/animation_on_scroll.dart';
import 'package:tech_tak/generated/l10n.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    switch (RM.data.deviceType) {
      case DeviceTypeView.mobile || DeviceTypeView.tablet:
        return const _DescriptionWidgetMobile();
      case DeviceTypeView.desktop:
        return const _DescriptionWidgetWeb();

      default:
        return const _DescriptionWidgetWeb();
    }
  }
}

class _DescriptionWidgetWeb extends StatelessWidget {
  const _DescriptionWidgetWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    final double imageWidth =
        RM.data.mapSize(mobile: 200, tablet: 300, desktop: 400);
    final double imageHeight =
        RM.data.mapSize(mobile: 200, tablet: 300, desktop: 400);

    return Column(
      children: [
        // Animate the first row with a slight delay.
        AnimatedOnScroll(
          delay: const Duration(milliseconds: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: RM.data.mapSize(mobile: 250, tablet: 350, desktop: 500),
                child: Text(
                  S.of(context).description,
                  style: AppTextStyles.bold28()
                      .copyWith(color: ColorsBox.primaryColor),
                ),
              ),
              Image.asset(
                AssetsBox.description3,
                width: imageWidth,
                height: imageHeight,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Animate the second row.
        AnimatedOnScroll(
          delay: const Duration(milliseconds: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AssetsBox.description1,
                width: imageWidth,
                height: imageHeight,
              ),
              SizedBox(
                width: RM.data.mapSize(mobile: 250, tablet: 350, desktop: 500),
                child: Text(
                  S.of(context).description2,
                  style: AppTextStyles.bold28()
                      .copyWith(color: ColorsBox.primaryColor),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Animate the third row.
        AnimatedOnScroll(
          delay: const Duration(milliseconds: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: RM.data.mapSize(mobile: 250, tablet: 350, desktop: 500),
                child: Text(
                  S.of(context).description3,
                  style: AppTextStyles.bold28()
                      .copyWith(color: ColorsBox.primaryColor),
                ),
              ),
              Image.asset(
                AssetsBox.description2,
                width: imageWidth,
                height: imageHeight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DescriptionWidgetMobile extends StatelessWidget {
  const _DescriptionWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    final double imageWidth =
        RM.data.mapSize(mobile: 200, tablet: 370, desktop: 450);
    final double imageHeight =
        RM.data.mapSize(mobile: 200, tablet: 370, desktop: 450);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Animate the image at the top.
        AnimatedOnScroll(
          delay: const Duration(milliseconds: 100),
          child: Image.asset(
            AssetsBox.description3,
            width: imageWidth,
            height: imageHeight,
          ),
        ),
        const SizedBox(height: 10),
        // Animate the first text.
        AnimatedOnScroll(
          delay: const Duration(milliseconds: 50),
          child: SizedBox(
            width: RM.data.mapSize(mobile: 200, tablet: 300, desktop: 500),
            child: Text(
              S.of(context).description,
              textAlign: TextAlign.center,
              style: AppTextStyles.bold28()
                  .copyWith(color: ColorsBox.primaryColor),
            ),
          ),
        ),
        SizedBox(height: RM.data.mapSize(mobile: 100, tablet: 120, desktop: 0)),
        // Animate the second image.
        AnimatedOnScroll(
          delay: const Duration(milliseconds: 50),
          child: Image.asset(
            AssetsBox.description1,
            width: imageWidth,
            height: imageHeight,
          ),
        ),
        const SizedBox(height: 10),
        // Animate the second text.
        AnimatedOnScroll(
          delay: const Duration(milliseconds: 50),
          child: SizedBox(
            width: RM.data.mapSize(mobile: 200, tablet: 300, desktop: 500),
            child: Text(
              S.of(context).description2,
              textAlign: TextAlign.center,
              style: AppTextStyles.bold28()
                  .copyWith(color: ColorsBox.primaryColor),
            ),
          ),
        ),
        SizedBox(height: RM.data.mapSize(mobile: 100, tablet: 120, desktop: 0)),
        // Animate the third image.
        AnimatedOnScroll(
          delay: const Duration(milliseconds: 50),
          child: Image.asset(
            AssetsBox.description2,
            width: imageWidth,
            height: imageHeight,
          ),
        ),
        const SizedBox(height: 10),
        // Animate the third text.
        AnimatedOnScroll(
          delay: const Duration(milliseconds: 50),
          child: SizedBox(
            width: RM.data.mapSize(mobile: 200, tablet: 300, desktop: 500),
            child: Text(
              S.of(context).description3,
              textAlign: TextAlign.center,
              style: AppTextStyles.bold28()
                  .copyWith(color: ColorsBox.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
