import 'package:lottie/lottie.dart';

abstract class Details {
  static List headlines = [
    "مرحبا بيك بتطبيق طبيبي",
    'تكدر تستشير طبيب',
    'تكدر تحجز عند طبيب'
  ];
  static List subTexts = [
    'طبيبي هو تطبيق يساعدك على العثور على الاطباء و العيادات من مختلف محافظات العراق',
    'تطبيق طبيبي فيه اكثر من 250 طبيب من مختلف محافظات العراق',
    'يوفرلك التطبيق امكانية الحجز عند الطبيب مع موعد محدد'
  ];
  static List animations = [
    LottieBuilder.asset('Assets/Lottie json/welcome.json'),
    LottieBuilder.asset('Assets/Lottie json/medical-app.json'),
    LottieBuilder.asset('Assets/Lottie json/medical-frontliners.json'),
  ];
}
