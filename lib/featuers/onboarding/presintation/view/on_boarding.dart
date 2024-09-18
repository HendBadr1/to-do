import 'package:flutter/material.dart';
import 'package:todo/core/utils/images.dart';
import 'package:todo/featuers/onboarding/presintation/view/widgets/on_boardingbody.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBody()
    );
  }
}


