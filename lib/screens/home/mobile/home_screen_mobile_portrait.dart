import 'package:flutter/material.dart';

class HomeScreenMobilePortrait extends StatelessWidget {
  const HomeScreenMobilePortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
