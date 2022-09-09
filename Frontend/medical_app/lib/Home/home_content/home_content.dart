import 'package:flutter/material.dart';

import 'package:medical_app/Home/home_content/specialities.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  static final List<String> doctorsImages = [
    'doctor-1.png',
    'doctor-2.png',
    'doctor-3.png',
    'doctor-4.png',
    'doctor-5.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Specialities(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadLineText(text: 'اشهر الاطباء'),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 600,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: doctorsImages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 500,
                            child: Stack(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 35, top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12)),
                                  width: 350,
                                  height: 500,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Transform.scale(
                                    scale: 1,
                                    child: Container(
                                        width: 350,
                                        child: Image.asset(
                                            'Assets/images/${doctorsImages[index]}')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SubText(text: 'hello')
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
