import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/home_page/view/widgets/language_dialoge.dart';
import 'package:tech_tak/generated/l10n.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
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
              color: ColorsBox.primaryColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.language,
                color: ColorsBox.white,
                size: iconSize,
              ),
              Text(
                S.of(context).currentLang,
                style:
                    AppTextStyles.regular12().copyWith(color: ColorsBox.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
