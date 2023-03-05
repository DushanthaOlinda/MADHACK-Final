import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:madhack_finals/screens/home/home.dart';
import 'firebase_options.dart';

import 'package:madhack_finals/constants.dart';
import 'package:madhack_finals/screens/welcome/welcome_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'MadHack Final',
      theme: ThemeData(
        primaryColor: primary,
        primaryColorLight: primaryLight,
        scaffoldBackgroundColor: Colors.white
      ),
<<<<<<< Updated upstream
      home: const WelcomeScreen(),
=======
      home: WelcomeScreen(),
>>>>>>> Stashed changes
    );
  }
}
