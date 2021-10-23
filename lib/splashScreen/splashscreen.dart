//@dart=2.9
import 'package:devolopment/home_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScrren extends StatelessWidget {
  const SplashScrren({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterSeconds: HomePage(),
      imageBackground: Image.asset('assets/images/splashscreen.jpg').image,
      loaderColor: Colors.orange,
      loadingText: Text('Loading...'),
      seconds: 12,
    );
  }
}
