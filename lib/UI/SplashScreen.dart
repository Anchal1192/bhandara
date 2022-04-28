import 'dart:async';

import 'package:bhandara/Method/Method.dart';
import 'package:bhandara/Utils/Colors.dart';
import 'package:bhandara/Utils/Constants.dart';
import 'package:bhandara/Utils/Images.dart';
import 'package:bhandara/Utils/String.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:new_version/new_version.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    getCurrentVersion();
    compareVersion();
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
            height: 400,
            //color: AppColors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Images.logo),
                  Text(
                    AppString.splashTitle,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 50,
                      fontFamily: 'Tapestry',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width/5,
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
            AppString.versionText + AppConstant.version,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getCurrentVersion() async {
    await PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      AppConstant.version = version;
    });
    setState(() {});
  }

  void compareVersion() async {
    final newVersion = NewVersion(
      androidId: AppConstant.androidId,
    );
    final status = await newVersion.getVersionStatus();
    if(status == null || status.localVersion == status.storeVersion) {
      // next();

    } else {
      newVersion.showUpdateDialog(
        context: context,
        versionStatus: status,
        dialogTitle: 'UPDATE!!',
        dismissButtonText: "Close",
        allowDismissal: false,
        dialogText: 'Please update the app from " + "${status.localVersion}" + " to " + "${status.storeVersion}',
        dismissAction: () {
          SystemNavigator.pop();
        },
        updateButtonText: 'Update',
      );
    }
  }

  void next() {
    Timer(Duration(seconds: 5), () =>
        Method.goAndReplace(context, LoginScreen()));
  }
}
