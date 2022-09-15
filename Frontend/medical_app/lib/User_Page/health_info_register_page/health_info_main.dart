import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:get/get.dart';
import 'gender_card.dart';

class HealthInfoRegister extends StatelessWidget {
  TextEditingController hegihtController = TextEditingController(text: "63");
  HealthInfoRegister({super.key});

  final Rx<bool> maleSelection = Rx<bool>(false);
  final Rx<bool> femaleSelection = Rx<bool>(false);
  @override
  Widget build(BuildContext context) {
    Timer? timer;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            LottieBuilder.asset("Assets/Lottie json/health-checkup.json"),
            Row(
              children: [
                Expanded(
                  child: Obx(() => GestureDetector(
                        onTap: () {
                          femaleSelection.value = !femaleSelection.value;
                          femaleSelection.value
                              ? maleSelection.value = false
                              : maleSelection.value = true;
                        },
                        child: GenderCard(
                          flag: femaleSelection.value,
                          svgPictur: SvgPicture.asset("Assets/svg/female.svg"),
                          color: const Color(0xffEF4FD5),
                          title: "انثى",
                        ),
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Obx(() => GestureDetector(
                        onTap: () {
                          maleSelection.value = !maleSelection.value;
                          maleSelection.value
                              ? femaleSelection.value = false
                              : femaleSelection.value = true;
                        },
                        child: GenderCard(
                          flag: maleSelection.value,
                          svgPictur: SvgPicture.asset("Assets/svg/male.svg"),
                          color: const Color(0xff09B5FF),
                          title: "ذكر",
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 185,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 40,
                            color: Color.fromARGB(40, 0, 0, 0),
                            offset: Offset(0, 2))
                      ]),
                  child: Column(
                    children: [
                      const SubText(
                        text: "الطول",
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: 90,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: hegihtController,
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          style: GoogleFonts.vazirmatn(fontSize: 28),
                          decoration: const InputDecoration(
                            counterText: "",
                            suffix: SubText(
                              text: "cm",
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Color.fromARGB(59, 0, 0, 0),
                                      offset: Offset(0, 8))
                                ]),
                            child: IconButton(
                                onPressed: () {
                                  hegihtController.text =
                                      (int.parse(hegihtController.text) - 1)
                                          .toString();
                                },
                                icon: Icon(FontAwesome5.minus)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Color.fromARGB(59, 0, 0, 0),
                                      offset: Offset(0, 8))
                                ]),
                            child: GestureDetector(
                                onTapDown: (TapDownDetails tapDownDetails) {
                                  timer = Timer.periodic(
                                    Duration(milliseconds: 200),
                                    (timer) {
                                      hegihtController.text =
                                          (int.parse(hegihtController.text) + 1)
                                              .toString();
                                    },
                                  );
                                },
                                onTapUp: (details) {
                                  timer !=null ? timer!.cancel():null;
                                },
                                onTapCancel: (){
                                  timer !=null ? timer!.cancel():null;
                                },
                                // onTap: () {
                                //   hegihtController.text =
                                //       (int.parse(hegihtController.text) + 1)
                                //           .toString();
                                // },
                                child: Icon(FontAwesome5.plus)),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
