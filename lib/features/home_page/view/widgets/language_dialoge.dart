import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/core/widgets/custom_primary_button.dart';
import 'package:tech_tak/generated/l10n.dart';
import 'package:tech_tak/main.dart';

Future<dynamic> languageSelectionDialog(
  BuildContext context,
) {
  return showDialog(
      context: context,
      builder: (context) {
        final double dialogHeight =
            RM.data.mapSize(mobile: 130, tablet: 220, desktop: 220);
        final double dialogWidth =
            RM.data.mapSize(mobile: 250, tablet: 400, desktop: 400);
        final double buttonHeight =
            RM.data.mapSize(mobile: 30, tablet: 40, desktop: 50);
        final double buttonWidth =
            RM.data.mapSize(mobile: 80, tablet: 90, desktop: 100);
        final double padding =
            RM.data.mapSize(mobile: 15, tablet: 25, desktop: 25);
        return Dialog(
          child: SizedBox(
            height: dialogHeight,
            width: dialogWidth,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.language,
                        color: ColorsBox.primaryColor,
                        size: RM.data
                            .mapSize(mobile: 25, tablet: 30, desktop: 30),
                      ),
                      SizedBox(
                        width: RM.data
                            .mapSize(mobile: 10, tablet: 15, desktop: 15),
                      ),
                      Text(
                        S.of(context).chooseLang,
                        style: AppTextStyles.medium16()
                            .copyWith(color: ColorsBox.primaryColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomPrimaryButton(
                        onPressed: () {
                          Locale locale = const Locale('ar');
                          TechTak.of(context)?.changeLocale(locale);
                          GoRouter.of(context).pop();
                        },
                        title: 'العربية',
                        buttonHeight: buttonHeight,
                        buttonWidth: buttonWidth,
                      ),
                      CustomPrimaryButton(
                        onPressed: () {
                          Locale locale = const Locale('en');
                          TechTak.of(context)?.changeLocale(locale);
                          GoRouter.of(context).pop();
                        },
                        title: 'English',
                        buttonHeight: buttonHeight,
                        buttonWidth: buttonWidth,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
