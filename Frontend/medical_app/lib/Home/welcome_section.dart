import 'package:flutter/material.dart';

import '../reuseable_widgets/texts_types/headline_text.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        HeadLineText(
                          text: 'مرحبا مرتضى',
                          lineHeight: 1,
                          size: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          
                        ),
                        HeadLineText(
                          text: 'ابحث عن طبيب او عيادة',
                          lineHeight: 2,
                          size: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage('https://api.lorem.space/image/face?w=150&h=150'),
                      radius: 40,
                    )
                  ],
                );
  }
}