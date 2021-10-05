import 'dart:async';
import 'package:beyondant_dummy_app/home_screen/home_screen.dart';
import 'package:beyondant_dummy_app/onBoard_screen/onboardscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      var isEmail = prefs.getString('email') ?? '';
      Timer(
          Duration(seconds: 3),
          () => {
                if (isEmail != '')
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()))
                else
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => OnBoardScreen()))
              });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 25.h,
              width: 25.w,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
