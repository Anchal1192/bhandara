import 'dart:async';

import 'package:bhandara/Utils/Colors.dart';
import 'package:bhandara/Utils/Constants.dart';
import 'package:bhandara/Utils/Images.dart';
import 'package:bhandara/Utils/String.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.splashScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 180,
            //color: AppColors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppText.splashTitle,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 50,
                      fontFamily: 'Tapestry',
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Lottie.asset(Images.splashLoader))
                ]),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 50,
        child: Center(
          child: Text(
            AppText.versionText + AppConstant.version,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
