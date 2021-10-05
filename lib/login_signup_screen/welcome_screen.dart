import 'package:beyondant_dummy_app/login_signup_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const redcolor = Color(0xFFBF1E2E);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Capture and share everyday moments - \nphotos, thoughts, and many more.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Image.asset(
                  'assets/images/welcome.png',
                ),
                SizedBox(
                  height: 2.h,
                ),
                loginButton('LogIn', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }),
                SizedBox(
                  height: 1.5.h,
                ),
                signInButton('SingUp', () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String btnText, VoidCallback onClick) {
    return Container(
      height: 6.h,
      width: 80.w,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 5,
          side: BorderSide(color: redcolor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          btnText,
          style: TextStyle(
            color: redcolor,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget signInButton(String btnText, VoidCallback onClick) {
    return Container(
      height: 6.h,
      width: 80.w,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          primary: redcolor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
