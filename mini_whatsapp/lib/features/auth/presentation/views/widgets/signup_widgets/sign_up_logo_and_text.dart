import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/images.dart';
import '../../../../../../core/utils/constants/sizes.dart';

class SignUpLogoAndText extends StatelessWidget {
  const SignUpLogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.whatsAppLogo, height: 100),
        AppSizes.verticalSpace(AppSizes.md),
        Text(
          "Register to new account",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.darkGrey,
              ),
        ),
      ],
    );
  }
}
