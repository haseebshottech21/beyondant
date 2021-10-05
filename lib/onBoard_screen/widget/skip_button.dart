import 'package:beyondant_dummy_app/login_signup_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final textStyle = TextStyle(
  fontSize: 18.sp,
  color: Color(0xFFBF1E2E),
  fontWeight: FontWeight.w500,
);

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            child: Text(
              'Skip',
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
