import 'package:flutter/material.dart';

enum DeviceScreenType {
  Mobile,
  Tablet,
  Desktop,
}

class SizingInformation {
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.deviceScreenType,
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return 'SizingInformation( deviceScreenType: $deviceScreenType, screenSize: $screenSize, localWidgetSize: $localWidgetSize)';
  }
}

DeviceScreenType getDeviceScreenType(MediaQueryData mediaQueryData) {
  final deviceWidth = mediaQueryData.size.shortestSide;

  if (deviceWidth > 1112) return DeviceScreenType.Desktop;

  if (deviceWidth > 834) return DeviceScreenType.Tablet;

  return DeviceScreenType.Mobile;
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) => builder(
        context,
        SizingInformation(
          deviceScreenType: getDeviceScreenType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(
            constraints.maxWidth,
            constraints.maxHeight,
          ),
        ),
      ),
    );
  }
}

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop) {
          if (desktop != null) return desktop;
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
          if (tablet != null) return tablet;
        }

        return mobile;
      },
    );
  }
}

class OrientationLayout extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;

  const OrientationLayout({Key key, this.landscape, this.portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return landscape ?? portrait;
    }

    return portrait;
  }
}
