import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Screens/login/login.dart';

import 'package:madhack_finals/constants.dart';
import 'package:madhack_finals/screens/welcome/welcome_screen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MadHack Final',
      theme: ThemeData(
        primaryColor: primary,
        primaryColorLight: primaryLight,
        scaffoldBackgroundColor: Colors.white
      ),
      home:LoginScreen(),
    );
  }
}
