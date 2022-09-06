import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../textfield/registerTextField.dart';

class RegisterPassword extends StatelessWidget {
  const RegisterPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(alignment: Alignment.bottomLeft,child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back,size: 35,),)),
            Center(child: SizedBox(height: 350,child: LottieBuilder.asset('Assets/Lottie json/signup.json'))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "انشاء كلمة سر",
                style: GoogleFonts.vazirmatn(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RegisterTextField(
                    hintText: 'كلمة السر',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RegisterTextField(
                    hintText: 'تأكيد كلمة السر',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.blue),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
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
        ),
      ),
    );
  }
}
