import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/generated/l10n.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(S.of(context).bookingText,
        style: AppTextStyles.bold24().copyWith(color: ColorsBox.primaryColor));
  }
}
