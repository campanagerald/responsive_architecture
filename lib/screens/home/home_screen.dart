import 'package:flutter/material.dart';
import 'package:responsive_architecture/core/responsive_ui_utils/responsive_ui_utils.dart';
import 'package:responsive_architecture/screens/home/mobile/home_screen_mobile_portrait.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeScreenMobilePortrait(),
      ),
    );
  }
}
