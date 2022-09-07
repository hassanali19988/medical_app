import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const RegisterTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          
          height: 64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xfffdfdfd),
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Color.fromARGB(44, 0, 0, 0))
              ]),
          child: Directionality(
            textDirection:TextDirection.rtl,
            child:  SizedBox(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintStyle:GoogleFonts.vazirmatn(fontSize: 22,color: Color(0xffC4C4C4)),
                  hintText: hintText,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal:12 ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        );
  }
}
