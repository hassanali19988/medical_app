import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const SubText({
    Key? key,
    this.size = 22.0,
    required this.text,
    this.color = const Color(0xff929BA1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.vazirmatn(
          fontSize: size, fontWeight: FontWeight.w400, color: color),
    );
  }
}
