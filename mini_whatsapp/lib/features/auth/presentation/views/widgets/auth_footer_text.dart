import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';

class AuthFooterRichText extends StatelessWidget {
  const AuthFooterRichText({
    super.key,
    this.span1,
    this.span2,
    this.onPressed,
  });

  final String? span1;
  final String? span2;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: span1 ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            WidgetSpan(
              baseline: TextBaseline.ideographic,
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                onPressed: onPressed!,
                child: Text(
                  span2 ?? '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.secondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
