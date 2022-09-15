import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';

import '../Main_View/main_view.dart';
import '../User_Page/hold_on_animation.dart';


class MainButton extends StatelessWidget {
  final Color buttonColor;
  final Function() onPressed;
  final String buttonTitle;
  const MainButton({
    super.key,
    this.buttonColor = Colors.white, required this.onPressed, required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.blue),
      child: TextButton(
        onPressed: onPressed,
        child: HeadLineText(
          text: buttonTitle,
          lineHeight: 1,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
