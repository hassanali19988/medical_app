import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Main_View/main_view.dart';

class RegisterdAnimation extends StatefulWidget {
  const RegisterdAnimation({Key? key}) : super(key: key);

  @override
  State<RegisterdAnimation> createState() => _RegisterdAnimationState();
}

class _RegisterdAnimationState extends State<RegisterdAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _lottieAnimationController;

  @override
  void initState() {
    super.initState();

    _lottieAnimationController = AnimationController(
      vsync: this,
    );

    _lottieAnimationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainView(),
            ));
      }
    });
  }

  @override
  void dispose() {
    _lottieAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          'Assets/Lottie json/done.json',
          repeat: false,
          onLoaded: (composition) {
            // Future.delayed(Duration(seconds: 4));
            _lottieAnimationController.duration = composition.duration;
            _lottieAnimationController.forward();
          },
        ),
      ),
    );
  }
}
