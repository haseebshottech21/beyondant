import 'package:beyondant_dummy_app/onBoard_screen/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final titleStyle = TextStyle(
  fontSize: 20.sp,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

final subtitleStyle = TextStyle(
  fontSize: 14.sp,
  color: Colors.grey,
  fontWeight: FontWeight.w400,
);

class MainContent extends StatelessWidget {
  final index;
  const MainContent({
    Key? key,
    required this.index,
    required this.onboardlist,
  }) : super(key: key);

  final List<OnboardingModel> onboardlist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.h),
      child: Column(
        children: [
          Image.asset(
            onboardlist[index].onBoardImage,
            width: 85.w,
          ),
          Text(
            onboardlist[index].onBoardTitle,
            style: titleStyle,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            onboardlist[index].onBoardSubTitle,
            style: subtitleStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
