import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_router.dart';
import 'core/utils/functions/build_theme_data.dart';
import 'core/utils/functions/change_status_bar_color.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  changeStatusBarColor();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      routerConfig: AppRouter.router,
    );
  }
}
