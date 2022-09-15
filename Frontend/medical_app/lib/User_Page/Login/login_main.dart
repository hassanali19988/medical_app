import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/User_Page/hold_on_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Main_View/main_view.dart';
import '../../models/user_model/account_model.dart';
import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../textfield/registerTextField.dart';

import 'loginValidationDetails.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LottieBuilder.asset(
                'Assets/Lottie json/login_screen_animation.json',
                repeat: false,
              ),
              // SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RegisterTextField(
                        hintText: 'البريد الالكتروني',
                        controller: email,
                        // validate: emailValidation.value,
                        // errormsg: emailErrorMsg,
                        validator: (p0) {
                          if (p0 != null) {
                            bool emailValidator = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(p0);
                            return emailValidator == false
                                ? "الايميل غير صحيح"
                                : null;
                          }
                        }),
                    const SizedBox(height: 10),
                    RegisterTextField(
                      hintText: 'كلمة السر',
                      controller: password,
                      // validate: passwordValidation.value,
                      // errormsg: passwordErrorMsg,
                      isPrivate: true,
                      validator: (p0) {
                        if (p0 != null) {
                          if (p0.isEmpty) {
                            return "الرجاء كتابة الرمز السري";
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  child: TextButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      final Rx<bool> userFound = Rx<bool>(false);
                      for (UserAccount user in User.users) {
                        if (email.text == user.email &&
                            password.text == user.password) {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString('userEmail', email.text);
                          prefs.setString('userPassword', password.text);
                          userFound.value = true;
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HoldOnAnimation(
                                  animationDirectory:
                                      'Assets/Lottie json/login_success.json',
                                  whenItEnds: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainView(),
                                      )),
                                ),
                              ));
                        }
                      }
                      if (userFound.value == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('there is no such user '),
                          ),
                        );
                      }
                      // loginTohome(
                      //     context: context, email: email, password: password);
                    },
                    child: const HeadLineText(
                      text: 'تسجيل الدخول',
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
      ),
    );
  }
}

