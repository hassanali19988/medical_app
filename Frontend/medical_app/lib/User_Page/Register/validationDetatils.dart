import 'package:flutter/material.dart';
import 'package:get/get.dart';
final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  Rx<bool> firstNameValidation = Rx<bool>(false);
  String firstNameErrorMsg = 'first name error';

  Rx<bool> lastNameValidation = Rx<bool>(false);
  String lastNameErrorMsg = 'last name error';

  Rx<bool> emailValidation = Rx<bool>(false);
  String emailErrorMsg = 'email is incorrect';

  Rx<bool> passwordValidation = Rx<bool>(false);
  String passwordErrorMsg = 'password error';