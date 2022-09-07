import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model/account_model.dart';
import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../textfield/registerTextField.dart';
import 'loggedin_animation.dart';
import 'package:medical_app/main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static final TextEditingController email = TextEditingController();
  static final TextEditingController password = TextEditingController();

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
                children: [
                  RegisterTextField(
                      hintText: 'البريد الالكتروني', controller: email),
                  SizedBox(height: 10),
                  RegisterTextField(hintText: 'كلمة السر', controller: password),
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
                    print('email:${email.text}\npassword:${password.text}');

                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString('userEmail', email.text);
                    prefs.setString('userPassword', password.text);
                    for (UserAccount user in User.users) {
                      if (email.text == user.email &&
                          password.text == user.password) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoggedinAnimation(),
                            ));
                      }
                    }
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
    );
  }
}
