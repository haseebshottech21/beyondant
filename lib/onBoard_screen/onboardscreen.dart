import 'package:flutter/material.dart';
import 'package:beyondant_dummy_app/onBoard_screen/models/onboarding_model.dart';
import 'widget/main_content.dart';
import 'widget/skip_button.dart';
import 'widget/steps_container.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int page = 0;
  final pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> onboardlist = OnboardingModel.list;
    pageController.addListener(() {
      setState(() {
        page = pageController.page!.round();
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SkipButton(),
            Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemCount: onboardlist.length,
                  itemBuilder: (context, index) {
                    return MainContent(
                      onboardlist: onboardlist,
                      index: index,
                    );
                  }),
            ),
            StepsContainer(
              page: page,
              onboardlist: onboardlist,
              pageController: pageController,
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
