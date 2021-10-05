import 'package:beyondant_dummy_app/home_screen/home_screen.dart';
import 'package:beyondant_dummy_app/login_signup_screen/widget/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'widget/input_text.dart';

const redcolor = Color(0xFFBF1E2E);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  String email = 'admin';
  String pass = 'admin';

  Future checkLogin() async {
    if (emailController.text == email && passController.text == pass) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('email', emailController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Successful!"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Username & Password Invalid!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BackIcon(),
              SizedBox(
                height: 1.h,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Text(
                  'Log In to \nBeyondant.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Column(
                  children: [
                    InputTextField(
                      controller: emailController,
                      labelText: 'Email',
                      iconData: Icons.person,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InputTextField(
                      controller: passController,
                      labelText: 'Password',
                      iconData: Icons.lock,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      color: redcolor,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              loginButton('LogIn', checkLogin),
              Stack(
                children: [
                  Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/secure.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 165,
                    top: 130,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/logo.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton(String btnText, VoidCallback onClick) {
    return Container(
      height: 7.h,
      width: 88.w,
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
