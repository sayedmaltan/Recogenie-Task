import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reco_genie/features/authentication/presentation/views/auth_screen_view.dart';
import 'package:reco_genie/features/home/presentation/views/home_screen_view.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreenView();
          } else {
            return AuthScreenView();
          }
        },
      ),
    );
  }
}
