import 'package:flutter/material.dart';
import 'package:madhack_finals/constants.dart';
import 'package:madhack_finals/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('MadHack'),
      //   backgroundColor: primaryLight,
      // ),
      body: Body(),
    );
  }
}
