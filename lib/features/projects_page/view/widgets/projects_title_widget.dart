import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/generated/l10n.dart';

class ProjectsTitleWidget extends StatelessWidget {
  const ProjectsTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    return Text(S.of(context).ourProjects,
        style: AppTextStyles.bold24().copyWith(color: ColorsBox.primaryColor));
  }
}
