import 'package:flutter/material.dart';
import 'package:reco_genie/features/home/presentation/views/widgets/home_screen_body.dart';


class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Food Menu",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal, // Example app bar color
        foregroundColor: Colors.white, // Text color
      ),
      body: HomeScreenBody(),
    );
  }
}

