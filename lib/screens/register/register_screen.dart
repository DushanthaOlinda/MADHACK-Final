import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madhack_finals/screens/login/login_screen.dart';
import 'package:madhack_finals/screens/login/components/background.dart';

import '../../main.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  String fullName = "";
  String regNo = "";
  String email = "";
  String password = "";


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "REGISTER",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Form(
              key: registerFormKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(labelText: "Full Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "full name required";
                        } else {
                          widget.fullName = value!;
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: "Reg no"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "regNo required";
                        } else {
                          widget.regNo = value!;
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email required";
                        } else if (!RegExp(r'^\S+@\S+\.\S+$')
                            .hasMatch(value!)) {
                          return "invalid email";
                        } else {
                          widget.email = value!;
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password required";
                        } else if (!RegExp(
                            r'^(?=.?[A-Z])(?=.?[a-z])(?=.*?[0-9]).{8,}$')
                            .hasMatch(value!)) {
                          return "Password must be 8 characters long and should contain at least one uppercase letter, lowercase letter and one digit";
                        } else {
                          widget.password = value!;
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () async {
                  final isValid = registerFormKey.currentState!.validate();
                  bool isValidUser = false;

                  if (!isValid) {
                    return;
                  }

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                  try {
                    // register user in auth
                    UserCredential newUser =
                    await _auth.createUserWithEmailAndPassword(
                      email: widget.email,
                      password: widget.password,
                    );

                    if (newUser != null) {
                      // add user to firestore

                      //document reference
                      final CollectionReference users = FirebaseFirestore.instance.collection('users');
                      final userDoc = users.doc(newUser.user?.uid);

                      final user = {
                        'full_name': widget.fullName,
                        'reg_no': widget.regNo,
                        'uid': userDoc.id,
                        'profile_image': '',
                        'role': "student"
                      };

                      // add user data to document
                      await userDoc.set(user);

                      print("working");
                      isValidUser = true;
                    }

                    navigatorKey.currentState!
                        .popUntil((route) => route.isCurrent);
                  }
                  on FirebaseAuthException catch (e) {
                    navigatorKey.currentState!
                        .popUntil((route) => route.isCurrent);
                    print(e);
                    if(e.code == "email-already-in-use"){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                              'A user with this email already exists!'),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ),
                      );
                    }
                  }

                  if (isValidUser == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Registration Successful!'),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(0),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    minimumSize: Size(size.width * 0.5, 50.0)),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()))
                },
                child: const Text(
                  "Already Have an Account? Sign in",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}