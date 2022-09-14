
import 'package:flutter/material.dart';

import 'OnBoarding/onboarding_main.dart';
import 'notifications/notifications.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
       debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Notifications(),
    );
  }
}

