import 'package:flutter/material.dart';

class Method {

  // static void printLog(message) {
  //   if (isPrint)
  //     print(message);
  // }

  // static Future<void> makeCallEmail(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // static void shareData({String? assetImagePath, required String message}) {
  //   if (assetImagePath == null || assetImagePath.isEmpty) {
  //     Share.share(message);
  //   } else {
  //     Share.shareFiles(['${assetImagePath}'], text: message);
  //   }
  // }

  static void showBottomMessage(context, message, bgColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      backgroundColor: bgColor,
      duration: Duration(milliseconds: 700),
    ));
  }

  static void showAlertDialog(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      content: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(padding: EdgeInsets.all(8),
                    child: Text("Message", style: TextStyle(fontSize: 16))),
                Divider(),
                Container(padding: EdgeInsets.all(8), child: Text(message)),
              ],
            )
          ]),
    );
    showDialog(barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showAlertDialogWithButton(BuildContext context, String message, Function function) {
    Widget cancelButton = TextButton(
      child: Text('Cancel', style: TextStyle(color: Colors.amber)),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text('Continue', style: TextStyle(color: Colors.amber),),
      onPressed:  () {
        function();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text('Alert'),
      content: Text(message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(color: Colors.amber,),
          Container(
              margin: EdgeInsets.only(left: 10), child: Text('Loading')),
        ],),
    );
    showDialog(barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // static Widget image(String imagePath, {height, width, boxfit}) {
  //   return CachedNetworkImage(
  //     height: height,
  //     width: width,
  //     fit: boxfit,
  //     imageUrl: imagePath,
  //     placeholder: (context, url) => new Image.asset(Images.no_image),
  //     errorWidget: (context, url, error) => new Image.asset(Images.no_image),
  //   );
  // }

  // static Future<void> checkPermission(BuildContext context, Permission permission, Function callback) async {
  //   var status = await permission.status;
  //   if (status.isGranted) {
  //     callback();
  //   } else {
  //     await permission.request().then((value) async {
  //       if(value.isGranted) {
  //         callback();
  //       } else {
  //         AppConstants.showBottomMessage(context, 'To download, allow permission', Colors.black);
  //       }
  //     });
  //   }
  // }

  static Future<void> goTo(BuildContext context, Widget route) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => route
        )
    );
  }

  static Future<void> goAndReplace(BuildContext context, Widget route) async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => route
        )
    );
  }

}