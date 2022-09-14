


import 'package:flutter/material.dart';

import '../models/onboarding_models/onboarding_details.dart';
import '../reuseable_widgets/texts_types/headline_text.dart';
import '../reuseable_widgets/texts_types/sub_text.dart';

class OnBoardingMain extends StatefulWidget {
 const OnBoardingMain({Key? key}) : super(key: key);

  @override
  State<OnBoardingMain> createState() => _OnBoardingMainState();
}

class _OnBoardingMainState extends State<OnBoardingMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: Details.headlines.length,
        itemBuilder: (context, index) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: const Color(0xFFf6f6f6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 350,
                      width: 400,
                      child: Details.animations[index],
                    ),
                    const SizedBox(height: 20),
                    HeadLineText(text: Details.headlines[index]),
                    SubText(text: Details.subTexts[index])
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
