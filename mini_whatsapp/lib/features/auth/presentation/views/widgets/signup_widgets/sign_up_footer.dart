import 'package:flutter/material.dart';

import '../auth_footer_text.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthFooterRichText(
      span1: "Already have an account ?",
      span2: "Login here",
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
