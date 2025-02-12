import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/generated/l10n.dart';

class LinksButton extends StatelessWidget {
  final Function() onPressed;
  final bool enabled;
  final Widget icon;

  /// A custom button widget that displays an icon in the center of a circular button.
  ///
  /// `Parameters`
  ///
  /// - [onPressed] `Function()` The callback function to be called when the button is pressed.
  /// - [enabled] `bool` Indicates whether the button is enabled.
  /// - [buttonSize] `double` The button size. By default: [mobile: 32, tablet: 42, desktop: 46].
  /// - [icon] `Widget` The icon displayed in the center of the button.
  ///
  const LinksButton({
    super.key,
    required this.onPressed,
    this.enabled = true,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    // <--- default size of the button ---> //
    final defaultHeight = RM.data.mapSize(mobile: 35, tablet: 35, desktop: 35);

    final defaultWidth =
        RM.data.mapSize(mobile: 130, tablet: 130, desktop: 130);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: defaultHeight,
          width: defaultWidth,

          // <--- button style ---> //
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: enabled ? ColorsBox.primaryColor : ColorsBox.greyBody,
          ),

          // <--- button content ---> //
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(
                  width: RM.data.mapSize(mobile: 8, tablet: 10, desktop: 10),
                ),
                Text(
                  S.of(context).visitWebsite,
                  style: AppTextStyles.regular10()
                      .copyWith(color: ColorsBox.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
