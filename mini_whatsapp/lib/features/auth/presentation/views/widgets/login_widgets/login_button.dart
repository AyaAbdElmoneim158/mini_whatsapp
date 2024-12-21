import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/app_button.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/constants/strings.dart';

class LoginButton extends StatelessWidget {
  final void Function() onPressed;
  const LoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      text: AppStrings.login,
      padding: AppSizes.lg - 4,
    );
  }
}
