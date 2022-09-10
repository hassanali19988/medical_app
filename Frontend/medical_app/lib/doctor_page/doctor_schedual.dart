import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/date_picker_timeline-1.2.3/date_picker_timeline.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';

class DoctorSchedual extends StatefulWidget {
  const DoctorSchedual({super.key});

  @override
  State<DoctorSchedual> createState() => _DoctorSchedualState();
}

class _DoctorSchedualState extends State<DoctorSchedual> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadLineText(text: 'جدول المواعيد',size: 24,color: Colors.black,),
        DatePicker(
          daysCount: 4,
        width:80,
        height:110,
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.black,
        
        selectedTextColor: Colors.white,
        
        dateTextStyle: GoogleFonts.vazirmatn(fontSize: 18),
        monthTextStyle:GoogleFonts.vazirmatn(fontSize: 18),
        dayTextStyle: GoogleFonts.vazirmatn(fontSize: 18),
        deactivatedColor:Colors.grey,
        
        inactiveDates: [DateTime(2022,9,12)],
        onDateChange: (date) {
          print(date);
        },
        
      )
      ],
    );
  }
}