import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/User_Page/hold_on_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Main_View/main_view.dart';
import '../../models/user_model/account_model.dart';
import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../textfield/registerTextField.dart';
import 'loggedin_animation.dart';

import 'loginValidationDetails.dart';
import 'loginValidations.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RegisterTextField(
                      hintText: 'البريد الالكتروني',
                      controller: email,
                      validate: emailValidation.value,
                      errormsg: emailErrorMsg),
                  const SizedBox(height: 10),
                  RegisterTextField(
                      hintText: 'كلمة السر',
                      controller: password,
                      validate: passwordValidation.value,
                      errormsg: passwordErrorMsg,isPrivate: true,),
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
                  onPressed: () {
                    setState(() {
                      loginTohome(
                          context: context, email: email, password: password);
                    });
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

Future<Null> loginTohome(
    {required email, required password, required context}) async {
  final Rx<bool> userFound = Rx<bool>(false);
  if (emailValidations() && passwordValidations()) {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userEmail', email.text);
    prefs.setString('userPassword', password.text);
    for (UserAccount user in User.users) {
      if (email.text == user.email && password.text == user.password) {
        userFound.value = true;
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HoldOnAnimation(
                animationDirectory: 'Assets/Lottie json/login_success.json',
                whenItEnds: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainView(),
                    )),
              ),
            ));
      }
    }
  }
  if (!userFound.value &&
      emailValidation.value == false &&
      passwordValidation.value == false) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('there is no such user '),
      ),
    );
  }
}
