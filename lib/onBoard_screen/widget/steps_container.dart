import 'package:beyondant_dummy_app/constants.dart';
import 'package:beyondant_dummy_app/login_signup_screen/welcome_screen.dart';
import 'package:beyondant_dummy_app/onBoard_screen/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const redcolor = Color(0xFFBF1E2E);

class StepsContainer extends StatelessWidget {
  const StepsContainer({
    Key? key,
    required this.page,
    required this.onboardlist,
    required this.pageController,
  }) : super(key: key);

  final int page;
  final List<OnboardingModel> onboardlist;
  final PageController pageController;
  double setGetStartButtonOnLastInformationScreen(
      int page, double ifLastValue, thenValue) {
    return page == informationSteppersLastScreen ? ifLastValue : thenValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setGetStartButtonOnLastInformationScreen(
        page,
        getSetBtnHeight,
        infoStepLastScreenHeight,
      ),
      width: setGetStartButtonOnLastInformationScreen(
        page,
        getSetBtnWidth,
        infoStepLastScreenWidth,
      ),
      child: Stack(
        children: [
          Container(
            height: setGetStartButtonOnLastInformationScreen(
              page,
              LastScreenHeight,
              infoStepLastScreenHeight,
            ),
            width: setGetStartButtonOnLastInformationScreen(
              page,
              LastScreenWidth,
              infoStepLastScreenWidth,
            ),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redcolor),
              value: (page) / (onboardlist.length - 1),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                if (page < onboardlist.length &&
                    page != onboardlist.length + 1) {
                  pageController.animateToPage(
                    page + 1,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInCirc,
                  );
                  // print(page);
                }
              },
              child: page == informationSteppersLastScreen
                  ? Container(
                      height: 6.h,
                      width: 75.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: redcolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 8.h,
                      width: 15.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: redcolor,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 21.sp,
                        color: Colors.white,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
