import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/images.dart';
import '../../core/utils/constants/styles.dart';
import '../../core/utils/constants/spacing.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        //   Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => const WelcomePage(),
        //   ),
        //       (route) => false,
        // );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Image.asset(
              AppAssets.whatsAppLogo,
              color: Colors.white,
              width: 100,
              height: 100,
            ),
            Column(
              children: [
                Text(
                  "from",
                  style: AppStyles.font18GrayRegular
                ),
                                verticalSpace(10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.meta,
                      color: Colors.white,
                      width: 35,
                      height: 35,
                    ),
                  
                    horizontalSpace(5),
                    const Text(
                      "Meta",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                verticalSpace(30)
              ],
            )
          ],
        ));
  }
}
