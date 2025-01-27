import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/generated/l10n.dart';

class DownloadButton extends StatelessWidget {
  final Function() onPressed;
  final bool enabled;
  final double? height;
  final double? width;

  final Widget icon;
  final String storeName;

  /// A custom button widget that displays an icon in the center of a circular button.
  ///
  /// `Parameters`
  ///
  /// - [onPressed] `Function()` The callback function to be called when the button is pressed.
  /// - [enabled] `bool` Indicates whether the button is enabled.
  /// - [buttonSize] `double` The button size. By default: [mobile: 32, tablet: 42, desktop: 46].
  /// - [icon] `Widget` The icon displayed in the center of the button.
  ///
  const DownloadButton({
    super.key,
    required this.onPressed,
    this.enabled = true,
    required this.icon,
    required this.storeName,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: height,
          width: width,

          // <--- button style ---> //
          decoration: BoxDecoration(
            color: enabled ? ColorsBox.primaryColor : ColorsBox.greyBody,
            borderRadius: BorderRadius.circular(50),
          ),

          // <--- button content ---> //
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                icon,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).downloadFrom,
                        style: AppTextStyles.regular2()
                            .copyWith(color: ColorsBox.white)),
                    Text(storeName,
                        style: AppTextStyles.regular1()
                            .copyWith(color: ColorsBox.white)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
