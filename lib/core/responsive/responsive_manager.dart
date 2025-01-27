import 'package:flutter/material.dart';

enum ViewSize {
  xSmall,
  small,
  medium,
  large,
  xLarge,
  xxLarge,
  xxxLarge,
}

enum DeviceTypeView { mobile, tablet, desktop, tv }

enum CustomOrientation { portrait, landscape, squared }

class RM {
  RM._();
  static final RM data = RM._();

  late TargetPlatform platform;
  late Orientation nativeOrientation;
  late CustomOrientation customOrientation; //
  late double width;
  late double height;
  late double physicalWidth;
  late double physicalHeight;
  late ViewSize viewSize;
  late DeviceTypeView deviceType;
  late double devicePixelRatio;
  late bool isLtr;

  void init(BuildContext context) {
    platform = Theme.of(context).platform;
    nativeOrientation = MediaQuery.of(context).orientation;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    physicalWidth = MediaQuery.of(context).size.width * devicePixelRatio;
    physicalHeight = MediaQuery.of(context).size.height * devicePixelRatio;
    customOrientation = calculateCustomOrientation();
    viewSize = calculateViewSize();
    deviceType = calculateDeviceTypeView();
    isLtr = Directionality.of(context) == TextDirection.ltr;
    printScreenInfo();
  }

  // void reCalculateData(BuildContext context) => init(context);

  ViewSize calculateViewSize() {
    if (width <= _BreakPoints.small) {
      return ViewSize.xSmall;
    } else if (width <= _BreakPoints.medium) {
      return ViewSize.small;
    } else if (width <= _BreakPoints.large) {
      return ViewSize.medium;
    } else if (width <= _BreakPoints.xLarge) {
      return ViewSize.large;
    } else if (width <= _BreakPoints.xxLarge) {
      return ViewSize.xLarge;
    } else if (width <= _BreakPoints.xxxLarge) {
      return ViewSize.xxLarge;
    } else if (width > _BreakPoints.xxxLarge) {
      return ViewSize.xxxLarge;
    } else {
      return ViewSize.small;
    }
    // switch (customOrientation) {
    //   // case portrait
    //   case CustomOrientation.portrait:
    //     if (width <= _BreakPoints.small) {
    //       return ViewSize.xSmall;
    //     } else if (width <= _BreakPoints.medium) {
    //       return ViewSize.small;
    //     } else if (width <= _BreakPoints.large) {
    //       return ViewSize.medium;
    //     } else if (width <= _BreakPoints.xLarge) {
    //       return ViewSize.large;
    //     } else if (width <= _BreakPoints.xxLarge) {
    //       return ViewSize.xLarge;
    //     } else if (width <= _BreakPoints.xxxLarge) {
    //       return ViewSize.xxLarge;
    //     } else {
    //       return ViewSize.xxxLarge;
    //     }

    //   // case any thing else portrait
    //   default:

    //     /// if the width (ie. originally the device height if phone )
    //     /// .is range of mobile height then mobile with xs size
    //     /// else if the width is greater than normal mobile hight then
    //     /// .the device is treated as it's normal size by width not limited to phone size
    //     // * first two conditions handles the phone when land scaped as tablet view
    //     if (height <= _BreakPoints.small && devicePixelRatio >= 2) {
    //       return ViewSize.xSmall;
    //     } else if (height <= _BreakPointsHeight.mobile &&
    //         devicePixelRatio >= 2) {
    //       return ViewSize.small;
    //     } // from here we will handle the non devices normally with width
    //     // the normal devices will be handled normally
    //     else {
    //       if (width <= _BreakPoints.small) {
    //         return ViewSize.xSmall;
    //       } else if (width <= _BreakPoints.medium) {
    //         return ViewSize.small;
    //       } else if (width <= _BreakPoints.large) {
    //         return ViewSize.medium;
    //       } else if (width <= _BreakPoints.xLarge) {
    //         return ViewSize.large;
    //       } else if (width <= _BreakPoints.xxLarge) {
    //         return ViewSize.xLarge;
    //       } else if (width <= _BreakPoints.xxxLarge) {
    //         return ViewSize.xxLarge;
    //       } else {
    //         return ViewSize.xxxLarge;
    //       }
    //     }
    // }

    // case land scape detect mobile  and other features
    // case not work as normal
  }

  CustomOrientation calculateCustomOrientation() {
    final double widthToHeightRatio =
        1 - (width < height ? width / height : height / width);

    final double percentWidthToHeightRatio = widthToHeightRatio * 100;

    print(percentWidthToHeightRatio);

    if (percentWidthToHeightRatio <= 15) {
      return CustomOrientation.squared;
    } else if (width > height) {
      return CustomOrientation.landscape;
    } else {
      return CustomOrientation.portrait;
    }
  }

  DeviceTypeView calculateDeviceTypeView() {
    if (width < _BreakPoints.medium) {
      return DeviceTypeView.mobile;
    } else if (width < _BreakPoints.xLarge) {
      return DeviceTypeView.tablet;
    } else if (width < _BreakPoints.xxxLarge) {
      return DeviceTypeView.desktop;
    } else if (width >= _BreakPoints.xxxLarge) {
      return DeviceTypeView.tv;
    } else {
      return DeviceTypeView.mobile;
    }

    // switch (customOrientation) {
    //   case CustomOrientation.portrait || CustomOrientation.squared:
    //     if (viewSize == ViewSize.xSmall || viewSize == ViewSize.small) {
    //       return DeviceTypeView.mobile;
    //     } else {
    //       return DeviceTypeView.tablet;
    //     }
    //   case CustomOrientation.landscape:
    //     if (viewSize == ViewSize.xSmall || viewSize == ViewSize.small) {
    //       return DeviceTypeView.tablet;
    //     } else if (viewSize == ViewSize.xxxLarge) {
    //       return DeviceTypeView.tv;
    //     } else {
    //       return DeviceTypeView.desktop;
    //     }
    //   default:
    //     return DeviceTypeView.mobile;
    // }
  }

  double mapSize({
    double? smallerMobile,
    required double mobile,
    required double tablet,
    double? largerTablet,
    required double desktop,
    double? largerDesktop,
    double? tvs,
  }) {
    switch (data.viewSize) {
      case ViewSize.xSmall:
        return smallerMobile ?? mobile;
      case ViewSize.small:
        return mobile;
      case ViewSize.medium:
        return tablet;
      case ViewSize.large:
        return largerTablet ?? tablet;
      case ViewSize.xLarge:
        return desktop;
      case ViewSize.xxLarge:
        return largerDesktop ?? desktop;
      case ViewSize.xxxLarge:
        return tvs ?? desktop;

      default:
        return mobile;
    }
  }

  mapValue<T>({
    T? smallerMobile,
    required T mobile,
    required T tablet,
    T? largerTablet,
    required T desktop,
    T? largerDesktop,
    T? tvs,
  }) {
    switch (data.viewSize) {
      case ViewSize.xSmall:
        return smallerMobile ?? mobile;
      case ViewSize.small:
        return mobile;
      case ViewSize.medium:
        return tablet;
      case ViewSize.large:
        return largerTablet ?? tablet;
      case ViewSize.xLarge:
        return desktop;
      case ViewSize.xxLarge:
        return largerDesktop ?? desktop;
      case ViewSize.xxxLarge:
        return tvs ?? desktop;

      default:
        return mobile;
    }
  }

  String mapFontFamily(
      {required String mobile,
      required String tablet,
      required String desktop,
      String? tv}) {
    switch (deviceType) {
      case DeviceTypeView.mobile:
        return mobile;

      case DeviceTypeView.tablet:
        return tablet;

      case DeviceTypeView.desktop:
        return desktop;

      case DeviceTypeView.tv:
        return tv ?? desktop;
      default:
        return mobile;
    }
  }

  FontWeight mapFontWeight(
      {required FontWeight mobile,
      required FontWeight tablet,
      required FontWeight desktop,
      FontWeight? tv}) {
    switch (deviceType) {
      case DeviceTypeView.mobile:
        return mobile;

      case DeviceTypeView.tablet:
        return tablet;

      case DeviceTypeView.desktop:
        return desktop;

      case DeviceTypeView.tv:
        return tv ?? desktop;
      default:
        return mobile;
    }
  }

  void printScreenInfo() {
    print("""
  \n
      platform: $platform
      nativeOrientation: $nativeOrientation
      customOrientation: $customOrientation
      width: $width
      height: $height
      physicalWidth: $physicalWidth
      physicalHeight: $physicalHeight
      viewSize: $viewSize
      deviceType: $deviceType
      devicePixelRatio: $devicePixelRatio
  """);
  }
}

class _BreakPoints {
  // note: xSmall is less than the small breakpoint 375
  static double small = 375;
  static double medium = 768;
  static double large = 1050;
  static double xLarge = 1320;
  static double xxLarge = 1745;
  static double xxxLarge = 2300;

  // note: xxxLarge is bigger than the xxxLarge breakpoint 1600
  // tvs and other bigger screens
}

// class _BreakPointsHeight {
//   static const double mobile = 720;
// }
// important widgets
// 1. aspect ratio for images and videos
