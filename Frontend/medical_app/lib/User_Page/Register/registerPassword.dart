import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:medical_app/User_Page/Register/registerd_animation.dart';

import '../../models/user_model/account_model.dart';
import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../textfield/registerTextField.dart';

class RegisterPassword extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  children:  [
                    RegisterTextField(
                      hintText: 'كلمة السر',
                      controller: _password,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RegisterTextField(
                      hintText: 'تأكيد كلمة السر',
                      controller: _confirmPassword,
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
                    print("first name:$firstName\nlast name:$lastName\nemail:$email\npassword: ${_password.text}\nconfirm password: ${_confirmPassword.text} ");
                    User().addUser( UserAccount(firstName: firstName,lastName: lastName,email: email,password: _password.text,));
                    
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => RegisterdAnimation(),));
                  },
                  child: const HeadLineText(
                    text: 'انشاء حساب جديد',
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
