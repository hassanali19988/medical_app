import 'validationDetatils.dart';

bool firstNameValidations() {
  if (firstName.text.isEmpty) {
    firstNameErrorMsg = 'name field can\'t be empty';
    firstNameValidation.value = true;
    return false;
  } else if (firstName.text.length <= 2) {
    firstNameErrorMsg = 'the name is too short';
    firstNameValidation.value = true;
    return false;
  } else {
    return true;
  }
}

bool lastNameValidations() {
  if (lastName.text.isEmpty) {
    lastNameErrorMsg = 'name field can\'t be empty';
    lastNameValidation.value = true;
    return false;
  } else if (lastName.text.length <= 2) {
    lastNameErrorMsg = 'the name is too short';
    lastNameValidation.value = true;
    return false;
  } else {
    return true;
  }
}

bool emailValidations() {
  bool emailvalue = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email.text);
  emailValidation.value = !emailvalue;
  return emailvalue;
}

bool passwordValidations(){
  if (password.text.isEmpty || confirmPassword.text.isEmpty) {
    
    passwordValidation.value = true;
    passwordErrorMsg = 'please fill both fields';
    return false;
  }
  if (password.text != confirmPassword.text) {
    
    passwordValidation.value = true;
    passwordErrorMsg = 'password is incorrect';
    return false;
  }
  if (password.text.length <=3) {
    passwordValidation.value = true;
    passwordErrorMsg = 'password is too weak';
    return false;
  }
  return true;
}