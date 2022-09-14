import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:get/get.dart';
import 'gender_card.dart';

class HealthInfoRegister extends StatelessWidget {
  HealthInfoRegister({super.key});
  final Rx<bool> maleSelection = Rx<bool>(false);
  final Rx<bool> femaleSelection = Rx<bool>(false);
  @override
  Widget build(BuildContext context) {
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
                          femaleSelection.value=!femaleSelection.value;
                          femaleSelection.value?maleSelection.value=false:maleSelection.value=true;
                        },
                        child: GenderCard(
                          flag: femaleSelection.value,
                          svgPictur: SvgPicture.asset("Assets/svg/female.svg"),
                          color: const Color(0xffEF4FD5),
                          title: "انثى",
                        ),
                      )),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Obx(() => GestureDetector(
                        onTap: (){
                          maleSelection.value=!maleSelection.value;
                          maleSelection.value?femaleSelection.value=false:femaleSelection.value=true;
                        }
                        ,
                        child: GenderCard(
                          flag: maleSelection.value,
                          svgPictur: SvgPicture.asset("Assets/svg/male.svg"),
                          color: const Color(0xff09B5FF),
                          title: "ذكر",
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
