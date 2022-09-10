import 'package:flutter/material.dart';
import '../reuseable_widgets/break_line.dart';
import 'doctor_details.dart';
import 'doctor_location.dart';
import 'doctor_personal_info_main.dart';
import 'doctor_schedual.dart';
import 'doctor_speciality.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  DoctorPersonalInfoMain(),
                  SizedBox(height: 35),
                  DoctorDetails(
                      text:
                          'طبيب اختصاص في علم الامراض بالإضافة الى عدة شهادات دولية في علم النفس (الشفاء الداخلي) '),
                  SizedBox(height: 20),
                  DoctorLocation(),
                  DoctorSpeciality(),
                  DoctorSchedual(),
                  SizedBox(height: 20),
                  Breakline(),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
