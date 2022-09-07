import 'loginValidationDetails.dart';

bool emailValidations() {
  bool emailPattern = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email.text);
  if (email.text.isEmpty) {
    emailValidation.value = true;
    emailErrorMsg = 'please fill email field';
    return false;
  } else if (!emailPattern) {
    emailValidation.value = true;
    emailErrorMsg = 'the email is incorrect';
    return false;
  }
    emailValidation.value = false;
  
  return true;
}

bool passwordValidations(){
  if (password.text.isEmpty) {
    passwordValidation.value = true;
    passwordErrorMsg = 'please fill password field';
    return false;
  }
  passwordValidation.value = false;
  return true;
}