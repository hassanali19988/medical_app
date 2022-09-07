import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/User_Page/Register/registerPassword.dart';
import 'package:medical_app/User_Page/Register/validations.dart';
import 'package:medical_app/reuseable_widgets/main_button.dart';

import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../Login/login_main.dart';
import '../textfield/registerTextField.dart';
import 'validationDetatils.dart';

class RegisterEmail extends StatefulWidget {
  RegisterEmail({Key? key}) : super(key: key);

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  @override
  Widget build(BuildContext context) {
    void navigateToPassword(
        {required BuildContext context,
        required String firstName,
        required String lastName,
        required String email}) {
      firstNameValidations();
      lastNameValidations();
      emailValidations();
      if (firstNameValidations() &&
          lastNameValidations() &&
          emailValidations()) {
        firstNameValidation.value = false;
        lastNameValidation.value = false;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPassword(
              firstName: firstName, //_firstName.text
              lastName: lastName, //_lastName.text
              email: email, //_email.text
            ),
          ),
        );
      }
    }

    return SafeArea(
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: RegisterTextField(
                        hintText: 'اسم العائلة',
                        controller: lastName,
                        errormsg: lastNameErrorMsg,
                        validate: lastNameValidation.value,
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: RegisterTextField(
                        hintText: 'الاسم الاول',
                        controller: firstName,
                        validate: firstNameValidation.value,
                        errormsg: firstNameErrorMsg,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RegisterTextField(
                    hintText: 'الحساب الالكتروني',
                    controller: email,
                    validate: emailValidation.value,
                    errormsg: emailErrorMsg,
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                  );
                                }),
                        ]),
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                      onPressed: () {
                        setState(() {
                          navigateToPassword(
                              context: context,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              email: email.text);
                        });
                      },
                      buttonTitle: 'اكمال التسجيل')
                ],
              ),
            ),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
