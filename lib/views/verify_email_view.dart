// ignore_for_file: use_build_context_synchronously

import 'package:firstflut/constants/routes.dart';
import 'package:firstflut/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify email")),
      body: Column(
        children: [
          const Text(
              "We've sent you an email verification. Please open it to verify your account"),
          const Text(
              "If you haven't received a verificaiton email yet, press the button below"),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().sendEmailVerification();
              },
              child: const Text("Send email verification.")),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text("Restart"))
        ],
      ),
    );
  }
}
