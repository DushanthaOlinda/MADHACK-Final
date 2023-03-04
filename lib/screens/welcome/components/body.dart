import 'package:flutter/material.dart';
import 'package:madhack_finals/constants.dart';
import 'package:madhack_finals/screens/home/home.dart';
import 'package:madhack_finals/screens/login/login_screen.dart';
import 'package:madhack_finals/screens/register/register_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "KuppiBuddy",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 15.0,
          ),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "An investment in knowledge",
                style: TextStyle(
                  color: primaryLight,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Image.asset("assets/images/logo.png"),
          SizedBox(
            width: 350,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                foregroundColor: primaryLight,
                backgroundColor: primaryLight,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 350,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                foregroundColor: primaryLight,
                backgroundColor: primaryLight.withOpacity(0.3),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()));
              },
              child: const Text(
                "SIGNUP",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
