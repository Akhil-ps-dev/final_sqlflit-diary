//@dart=2.9
import 'package:devolopment/screens/initial_pages/01_note_list.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScrren extends StatelessWidget {
  const SplashScrren({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterSeconds: NoteList(),
      imageBackground: Image.asset('assets/images/splashscreen.jpg').image,
      loaderColor: Colors.orange,
      loadingText: Text('Loading...'),
      seconds: 12,
    );
  }
}
