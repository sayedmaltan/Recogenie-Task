import 'package:flutter/material.dart';
import 'package:reco_genie/features/authentication/presentation/views/widgets/auth_screen_view_body.dart';

class AuthScreenView extends StatelessWidget {
  const AuthScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreenViewBody());
  }
}
