import 'package:flutter/material.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final bool enabled;
  final String title;
  final double? buttonWidth;
  final double? buttonHeight;

  ///
  ///  A custom button widget that displays text and an optional icon.
  ///
  /// `Parameters`
  ///
  /// - [onPressed] `Function()` The callback function to be called when the button is pressed.
  ///
  /// - [enabled] `bool` Indicates whether the button is enabled.
  ///
  /// - [title] `String` The text to be displayed on the button.
  ///
  /// - [buttonWidth] `double` The button width.
  ///
  /// - [buttonHeight] `double` The button height by default is [ mobile: 32 ,tablet: 42 ,desktop: 46].
  ///
  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.enabled = true,
    this.buttonWidth,
    this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    // <--- default height of the button ---> //
    final defaultHeight = RM.data.mapSize(
      mobile: 32,
      tablet: 42,
      largerTablet: 44,
      desktop: 46,
    );

    // <--- button border radius ---> //
    final buttonBorderRadius = RM.data.mapSize(
      mobile: 5.9,
      tablet: 8,
      largerTablet: 8,
      desktop: 4,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        child: enabled
            ? Ink(
                height: buttonHeight ?? defaultHeight,
                width: buttonWidth,

                // <--- button style ---> //
                decoration: BoxDecoration(
                  color: enabled ? ColorsBox.primaryColor : ColorsBox.greyBody,
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                ),

                // <--- button content ---> //
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium14().copyWith(
                      color: enabled ? Colors.white : ColorsBox.primaryColor,
                    ),
                  ),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
