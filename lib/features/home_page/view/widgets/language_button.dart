import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/home_page/view/widgets/language_dialoge.dart';
import 'package:tech_tak/generated/l10n.dart';

class LanguageButton extends StatelessWidget {
  final Color iconColor;
  final Color boxColor;

  const LanguageButton({
    super.key,
    required this.iconColor,
    required this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    final double borderRadius =
        RM.data.mapSize(mobile: 6, tablet: 8, desktop: 8);
    final double width = RM.data.mapSize(mobile: 70, tablet: 100, desktop: 100);
    final double padding = RM.data.mapSize(mobile: 30, tablet: 40, desktop: 50);
    final double height = RM.data.mapSize(mobile: 40, tablet: 40, desktop: 40);
    final double iconSize =
        RM.data.mapSize(mobile: 25, tablet: 25, desktop: 30);

    return Padding(
      padding: EdgeInsetsDirectional.only(end: padding),
      child: InkWell(
        onTap: () {
          languageSelectionDialog(context);
        },
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: iconColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.language,
                color: iconColor,
                size: iconSize,
              ),
              Text(
                S.of(context).currentLang,
                style: AppTextStyles.regular12().copyWith(color: iconColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
