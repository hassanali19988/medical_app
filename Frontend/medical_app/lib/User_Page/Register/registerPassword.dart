import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/User_Page/Register/validations.dart';


import '../../Main_View/main_view.dart';
import '../../models/user_model/account_model.dart';
import '../../reuseable_widgets/back_Icon.dart';
import '../../reuseable_widgets/main_button.dart';
import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../hold_on_animation.dart';
import '../textfield/registerTextField.dart';
import 'validationDetatils.dart';

class RegisterPassword extends StatefulWidget {
  final String firstName, lastName, email;
  const RegisterPassword({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(key: key);
  static final TextEditingController _password = TextEditingController();
  static final TextEditingController _confirmPassword = TextEditingController();

  @override
  State<RegisterPassword> createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // return back
              BackIcon(),
              // lottie widget
              Center(
                  child: SizedBox(
                      height: 350,
                      child: LottieBuilder.asset(
                          'Assets/Lottie json/signup.json'))),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                child: HeadLineText(text: "انشاء كلمة سر"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegisterTextField(
                      hintText: 'كلمة السر',
                      controller: password,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RegisterTextField(
                      hintText: 'تأكيد كلمة السر',
                      controller: confirmPassword,
                      validate: passwordValidation.value,
                      errormsg: passwordErrorMsg,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: MainButton(
                  buttonTitle: 'انشاء حساب جديد',
                  onPressed: () {
                    setState(() {
                      NavigateToHome(
                      firstName: widget.firstName,
                      lastName: widget.lastName,
                      email: widget.email,
                      context: context,
                      password: password.text,
                      confirmPassword: confirmPassword.text);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void NavigateToHome(
    {firstName, lastName, email, password, confirmPassword, context}) {
  
  if (passwordValidations()) {
    // when debugging
  if (kDebugMode) {
    print(
        "first name:$firstName\nlast name:$lastName\nemail:$email\npassword: ${password}\nconfirm password: $confirmPassword");
  }
    passwordValidation.value = false;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HoldOnAnimation(
          animationDirectory: 'Assets/Lottie json/done.json',
          whenItEnds: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainView(),
                ));
          },
        ),
      ));
      // Adding user to the local model
  User().addUser(UserAccount(
    firstName: firstName,
    lastName: lastName,
    email: email,
    password: password,
  ));
  }
  
  
  
}
