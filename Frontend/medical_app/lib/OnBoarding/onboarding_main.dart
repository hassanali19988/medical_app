import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/onboarding_models/onboarding_details.dart';
import '../reuseable_widgets/texts_types/headline_text.dart';
import '../reuseable_widgets/texts_types/sub_text.dart';

class OnBoardingMain extends StatefulWidget {
  OnBoardingMain({Key? key}) : super(key: key);

  @override
  State<OnBoardingMain> createState() => _OnBoardingMainState();
}

class _OnBoardingMainState extends State<OnBoardingMain> {
  final _pageViewController = PageController();
  static bool isLastPage = false;
  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6f6f6),
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            isLastPage = value == Details.animations.length - 1;
          });
        },
        controller: _pageViewController,
        itemCount: Details.headlines.length,
        itemBuilder: (context, index) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Details.animations[index],
                    // const SizedBox(height: 20),
                    HeadLineText(text: Details.headlines[index]),
                    SubText(text: Details.subTexts[index])
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(80)
                
              ),
            
              onPressed: () async{
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.pushNamed(context, '/home');
              },
              child: Text("ابدء",style: GoogleFonts.vazirmatn(fontSize: 30,color: Colors.white),))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => _pageViewController
                        .jumpToPage(Details.animations.length - 1),
                    child: const HeadLineText(
                      text: "تخطي",
                      lineHeight: 1,
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageViewController,
                      count: Details.animations.length,
                      onDotClicked: (index) {
                        _pageViewController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeIn,
                        );
                      },
                      effect: const WormEffect(
                          activeDotColor: Colors.blue,
                          dotWidth: 12,
                          dotHeight: 12),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _pageViewController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const HeadLineText(
                        text: "التالي",
                        lineHeight: 1,
                      )),
                ],
              ),
            ),
    );
  }
}
