import 'package:flutter/material.dart';

import '../auth_footer_text.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthFooterRichText(
      span1: "Don't have an account?",
      span2: "Register here",
      onPressed: () {
        Navigator.of(context).pushNamed('/signup');
      },
    );
  }
}
