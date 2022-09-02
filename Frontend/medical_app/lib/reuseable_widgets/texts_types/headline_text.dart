import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadLineText extends StatelessWidget {
  final double size;
  final String text;
  const HeadLineText({
    Key? key,
    this.size = 30.0,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.vazirmatn(fontSize: size,fontWeight: FontWeight.bold,color: Colors.blue,height: 3),);
  }
}
