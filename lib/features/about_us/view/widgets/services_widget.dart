import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';

class ServicesWidget extends StatelessWidget {
  final String title;
  final String description;
  const ServicesWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.semiBold18()
                .copyWith(color: ColorsBox.primaryColor),
          ),
          SizedBox(
            height: RM.data.mapSize(mobile: 8, tablet: 12, desktop: 15),
          ),
          Text(
            description,
            style: AppTextStyles.regular12()
                .copyWith(color: ColorsBox.primaryColor),
          ),
          SizedBox(
            height: RM.data.mapSize(mobile: 14, tablet: 20, desktop: 26),
          ),
        ],
      ),
    );
  }
}
