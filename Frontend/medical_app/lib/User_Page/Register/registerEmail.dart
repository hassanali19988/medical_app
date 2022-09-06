import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/User_Page/Register/registerPassword.dart';

import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../textfield/registerTextField.dart';

class RegisterEmail extends StatelessWidget {
  const RegisterEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: SizedBox(
                  height: 350,
                  child: LottieBuilder.asset('Assets/Lottie json/signup.json'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "انشاء حساب جديد",
                  style: GoogleFonts.vazirmatn(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Expanded(
                            child: RegisterTextField(
                          hintText: 'اسم العائلة',
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: RegisterTextField(
                          hintText: 'الاسم الاول',
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const RegisterTextField(
                      hintText: 'الحساب الالكتروني',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'لديك حساب بالفعل؟',
                          style: GoogleFonts.vazirmatn(color: Colors.black),
                          children: [
                            const WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 10)),
                            TextSpan(
                              text: "تسجيل الدخول",
                              style: GoogleFonts.vazirmatn(color: Colors.blue),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPassword(),
                                ));
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
              SizedBox(height: 150,)
            ],
          ),
        ),
      ),
    );
  }
}
