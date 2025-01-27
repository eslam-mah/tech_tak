import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    return Image.asset(
      AssetsBox.logoPngBlue,
      width: RM.data
          .mapSize(mobile: 129, tablet: 160, largerTablet: 170, desktop: 180),
    );
  }
}
