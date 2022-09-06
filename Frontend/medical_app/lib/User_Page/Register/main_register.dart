import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/User_Page/Register/registerEmail.dart';
import 'package:medical_app/User_Page/Register/registerPassword.dart';

import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../textfield/registerTextField.dart';
import 'package:get/get.dart';

class register extends StatelessWidget {
  register({Key? key}) : super(key: key);

  Rx<int> currentRegisterPage = Rx<int>(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RegisterEmail(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.blue),
            child: TextButton(
              onPressed: () {
                currentRegisterPage.value = 1;
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPassword(),));
                // print(currentRegisterPage);
              },
              child: const HeadLineText(
                text: 'اكمال التسجيل',
                lineHeight: 1,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        )
      ],
    );
  }
}
