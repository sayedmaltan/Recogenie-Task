import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/asstes.dart';
import '../../../../../core/widgets/custom_empty_button.dart';
import '../../../../../core/widgets/custom_full_button.dart';

class AuthScreenViewBody extends StatelessWidget {
  const AuthScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImages.welcomeScreen),
            Text(
              "Hello",
              style: GoogleFonts.acme(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to ",
                  style: GoogleFonts.acme(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 106, 106, 106),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "Reco Genie",
                  style: GoogleFonts.acme(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: CustomFullButton(
                text: 'Create an Account',
                onPressed: () => context.push(AppRouter.registerScreen),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: CustomEmptyButton(
                response: () => context.push(AppRouter.loginScreen),
                text: 'Sign in',
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
