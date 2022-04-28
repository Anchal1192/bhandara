import 'package:bhandara/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'UI/SplashScreen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: AppColors.transparent),
      ),
      home: SplashScreen(),
    );
  }
}


