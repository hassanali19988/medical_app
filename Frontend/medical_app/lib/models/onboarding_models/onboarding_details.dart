import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

abstract class Details {
  static List headlines = [
    "مرحبا بيك بتطبيق طبيبي",
    'تكدر تستشير طبيب',
    'تكدر تحجز عند طبيب'
  ];
  static List subTexts = [
    'طبيبي هو تطبيق يساعدك على العثور على الاطباء و العيادات',
    'تطبيق طبيبي فيه اكثر من 250 طبيب من مختلف محافظات العراق',
    'يوفرلك التطبيق امكانية الحجز عند الطبيب مع موعد محدد'
  ];
  static List animations = [
    LottieBuilder.asset(
      'Assets/Lottie json/welcome.json',
      fit: BoxFit.fill,
       width: 400,
    height: 350,
    ),
    LottieBuilder.asset(
      'Assets/Lottie json/medical-app.json',
      fit: BoxFit.contain,
      width: 400,
      height: 350,
    ),
    LottieBuilder.asset(
      'Assets/Lottie json/medical-frontliners.json',
      fit: BoxFit.contain,
      width: 400,
      height: 350,
    ),
  ];
}
