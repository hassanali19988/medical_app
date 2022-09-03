import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(80)
                
              ),
            
              onPressed: () async{
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.pushNamed(context, '/home');
              },
              child: Text("ابدء",style: GoogleFonts.vazirmatn(fontSize: 30,color: Colors.white),));
  }
}