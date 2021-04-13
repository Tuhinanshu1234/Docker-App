import 'package:firebase_core/firebase_core.dart';
import 'package:firetask_app/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SplashScreen(
              seconds: 8,
              backgroundColor: Colors.white,
              image: Image.asset('assets/open.gif'),
              loaderColor: Colors.white,
              photoSize: 200.0,
              navigateAfterSeconds: Mylog(),
            ),
          ),
        ]);
  }
}
