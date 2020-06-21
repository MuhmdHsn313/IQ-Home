import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../utils/constant.dart';

class Rate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String platform;

    if (Theme.of(context).platform == TargetPlatform.android) {
      platform = "Google Play";
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      platform = "Apple Store";
    }
    return GestureDetector(
      onTap: () async {
        RateMyApp rateMyApp = RateMyApp(
          preferencesPrefix: 'rateMyApp_',
          minDays: 7,
          minLaunches: 10,
          remindDays: 7,
          remindLaunches: 10,
          googlePlayIdentifier: Android_Package_ID,
          appStoreIdentifier: IOS_Package_ID,
        );
        await rateMyApp.init();
        await rateMyApp.showRateDialog(
          context,
          title: 'تقييم التطبيق',
          message: 'قم بتتقيم تطبيقنا على $platform',
          noButton: 'لا اريد',
          rateButton: 'قيم الان!',
          laterButton: 'لاحقاً',
        );
        // return await rateMyApp.launchStore();
      },
      child: Container(
        height: 83,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xffFFC34C),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/social-media.png",
                width: 62.67,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                "قيم التطبيق 5 نجوم"
                "\n"
                "على $platform",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
