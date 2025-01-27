import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';

class LinksButton extends StatelessWidget {
  final Function() onPressed;
  final bool enabled;
  final double? buttonSize;
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
    this.buttonSize,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    // <--- default size of the button ---> //
    final defaultSize = RM.data.mapSize(
      mobile: 32,
      tablet: 42,
      largerTablet: 44,
      desktop: 46,
    );

    final size = buttonSize ?? defaultSize;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        customBorder: const CircleBorder(),
        borderRadius: BorderRadius.circular(200),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Ink(
            height: size,
            width: size,

            // <--- button style ---> //
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: enabled ? ColorsBox.primaryColor : ColorsBox.greyBody,
            ),

            // <--- button content ---> //
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
