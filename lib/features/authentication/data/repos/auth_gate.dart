// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:reco_genie/core/utils/app_router.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if(snapshot.hasData) {
//               return AppRouter.homeScreen;
//             } else {
//               return AppRouter.authScreen;
//             }
//           },) ,
//     );
//   }
// }
