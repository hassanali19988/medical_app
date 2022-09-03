import 'package:flutter/material.dart';

import '../reuseable_widgets/texts_types/headline_text.dart';

class IndicatorsButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const IndicatorsButton({Key? key, required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
                    onPressed: onPressed,
                    child: HeadLineText(
                      text: title,
                      lineHeight: 1,
                    ),
                  );
  }
}