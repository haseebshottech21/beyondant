class OnboardingModel {
  final String onBoardImage;
  final String onBoardTitle;
  final String onBoardSubTitle;

  OnboardingModel(this.onBoardImage, this.onBoardTitle, this.onBoardSubTitle);
  static List<OnboardingModel> list = [
    OnboardingModel(
      'assets/images/onboard2.png',
      'Boost Your Traffic',
      'Outreach to many social networks to improve your statistics',
    ),
    OnboardingModel(
      'assets/images/onboard3.png',
      'Give the best solution',
      'We will give best solution for your business isues',
    ),
    OnboardingModel(
      'assets/images/onboard4.png',
      'Reach the target',
      'With our help, it will be easier to achieve your goals',
    ),
    OnboardingModel(
      'assets/images/onboard2.png',
      'Boost Your Traffic',
      'Outreach to many social networks to improve your statistics',
    ),
    OnboardingModel(
      'assets/images/onboard3.png',
      'Give the best solution',
      'We will give best solution for your business isues',
    ),
  ];
}
