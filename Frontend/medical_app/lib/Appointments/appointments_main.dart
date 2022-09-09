import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appointment_card.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments>
    with TickerProviderStateMixin {
      static const  double pagePadding = 16;
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding/2),
  //  indicatorPadding: EdgeInsets.zero,
   labelPadding: const EdgeInsets.symmetric(horizontal: pagePadding/2),
   isScrollable: true,
              labelColor: Colors.black,
              labelStyle: GoogleFonts.vazirmatn(fontSize: 20),
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4,
              tabs: const [
                Tab(text: 'المواعيد القادمة'),
                // SizedBox(width: 10,),
                Tab(text: 'المواعيد السابقة'),
              ],
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: pagePadding,vertical: 10),
                  child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return const AppointmentCard();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: pagePadding,vertical: 10),
                  child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return const AppointmentCard();
                    },
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
