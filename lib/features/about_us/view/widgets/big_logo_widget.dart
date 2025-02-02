import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';

class BigLogoWidget extends StatelessWidget {
  const BigLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    return Image.asset(
      AssetsBox.logoPngBlue,
      width: RM.data
          .mapSize(mobile: 270, tablet: 300, largerTablet: 330, desktop: 360),
    );
  }
}
