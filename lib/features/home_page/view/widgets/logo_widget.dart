import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';

class LogoWidget extends StatelessWidget {
  final String logo;
  const LogoWidget({
    super.key,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    return Image.asset(
      logo,
      width: RM.data
          .mapSize(mobile: 129, tablet: 160, largerTablet: 170, desktop: 180),
    );
  }
}
