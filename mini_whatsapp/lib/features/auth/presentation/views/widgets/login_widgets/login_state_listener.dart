import 'package:flutter/material.dart';

import '../../../../../../core/routes/routes.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';

void Function(BuildContext, AuthState) loginStateListener(BuildContext context) {
  return (context, state) {
    if (state is AuthLoadingState) {
      _showLoadingDialog(context);
    } else if (state is AuthSuccessState) {
      _handleSuccess(context);
    } else if (state is AuthErrorState) {
      _handleError(context, state);
    }
  };
}

void _showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

void _handleSuccess(BuildContext context) {
  Navigator.of(context).pop(); // Close the loading dialog
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Login Successful!')),
  );
  Navigator.pushNamed(context, AppRoutes.navigationMenuRoute);
}

void _handleError(BuildContext context, AuthErrorState state) {
  Navigator.of(context).pop(); // Close the loading dialog
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(state.error)),
  );
}
