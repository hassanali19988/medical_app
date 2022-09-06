import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';

import '../Appointments/appointments_main.dart';
import '../Home/home_main.dart';
import '../User_Page/Register/main_register.dart';

class MainView extends StatelessWidget {

  final List pages = [Home(),Appointments(),register()];
  Rx<int> currentIndex = Rx<int>(0);
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          currentIndex.value = index;
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: Obx(() {
        return SalomonBottomBar(
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          currentIndex: currentIndex.value,
          onTap: (i) {
            currentIndex.value = i;
            pageController.jumpToPage(i);
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home,
                size: 35,
              ),
              title: const Text("الرئيسية",style: TextStyle(fontSize: 16,)),
              selectedColor: Color(0xff2196F3),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.calendar_today_rounded,
                size: 35,
              ),
              title: const Text("المواعيد",style: TextStyle(fontSize: 16,)),
              selectedColor: Color(0xff2196F3),
            ),

            /// Search
            SalomonBottomBarItem(
              
              icon: const Icon(
                Icons.person_outline,
                size: 35,
              ),
              title: const Text("الحساب",style: TextStyle(fontSize: 16,)),
              selectedColor: Color(0xff2196F3),
            ),

            /// Profile
          ],
        );
      }),
    );
  }
}
