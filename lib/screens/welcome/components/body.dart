import 'package:flutter/material.dart';
import 'package:madhack_finals/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/images/bg.png"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "KuppiBuddy",
            style: TextStyle(
              color: primary,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(
          //   height: 80.0,
          // ),
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
              onPressed: null,
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
                backgroundColor: secondary,
              ),
              onPressed: null,
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
