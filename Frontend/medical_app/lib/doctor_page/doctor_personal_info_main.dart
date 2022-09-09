import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import '../reuseable_widgets/star_rating.dart';
import '../reuseable_widgets/texts_types/headline_text.dart';
import '../reuseable_widgets/texts_types/sub_text.dart';
class DoctorPersonalInfoMain extends StatelessWidget {
  const DoctorPersonalInfoMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    height: 115,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 105,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                HeadLineText(text: 'د.محمد علي رضا',color: Colors.black,size: 25,lineHeight: 1,),
                                SubText(text: 'يعمل في عيادة الهدى',),
                              ],
                            ),
                            StarRating(rate: Rx<int>(4),functional: false,)
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: SizedBox(width: 50,child: Icon(FontAwesome5.heart)),
                        )
                      ],
                    ),
                  );
  }
}