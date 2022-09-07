import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();

Rx<bool> emailValidation = Rx<bool>(false);
String emailErrorMsg = 'error email';

Rx<bool> passwordValidation = Rx<bool>(false);
String passwordErrorMsg = 'error password';

