import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:madhack_finals/constants.dart';
import 'package:madhack_finals/main.dart';
import 'package:madhack_finals/screens/home/admin_home.dart';
import 'package:madhack_finals/screens/login/components/background.dart';
import 'package:madhack_finals/screens/register/register_screen.dart';

import '../home/home.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  String role = "";
  String uid = "";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final db = FirebaseAuth.instance;
  final loginFormKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      body: SingleChildScrollView(child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            Image.asset("assets/images/login.jpg", width: size.width * 0.6),
            // const SizedBox(height: 10),
            Form(
              key: loginFormKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (value) {
                        email = value!;
                        if (email.isEmpty) {
                          return "email required";
                        } else if (!RegExp(r'^\S+@\S+\.\S+$').hasMatch(email)) {
                          return "invalid email";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        password = value!;
                        if (password.isEmpty) {
                          return "password required";
                        } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                            .hasMatch(password)) {
                          return "invalid password";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: const Text(
                "Forgot your password?",
                style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () async {
                  bool isValid = loginFormKey.currentState!.validate();

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

                  bool isValidUser = false;

                  try {
                    UserCredential user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    navigatorKey.currentState!.popUntil((route) => route.isFirst);

                    if (user != null) {
                      print(user.user?.uid);
                      widget.uid = user.user!.uid;

                      final CollectionReference users = FirebaseFirestore.instance.collection('users');
                      final userDoc = users.doc(user.user?.uid).get();

                      userDoc.then((DocumentSnapshot documentSnapshot){
                        if(documentSnapshot.exists){
                          final userData = documentSnapshot.data() as Map<String, dynamic>;
                          widget.role = userData['role'];
                          print(widget.role.toString());
                        }
                        else{
                          print('user does not exist');
                        }
                      });

                      isValidUser = true;
                    }
                  }
                  on FirebaseAuthException catch (e) {
                    navigatorKey.currentState!.popUntil((route) => route.isFirst);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Invalid username or password!'),
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
                    print(e);
                  }

                  if (isValidUser) {
                    if(widget.role.toString() == "student"){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home2(),
                        ),
                      );
                    }
                    else if(widget.role.toString() == "admin") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminHome(),
                        ),
                      );
                    }
                  }
                  else {
                    navigatorKey.currentState!.popUntil((route) => route.isActive);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Invalid username or password!'),
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
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(80.0),
                  //   gradient:
                  //       const LinearGradient(colors: [primary, primaryLight]),
                  // ),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  ),
                },
                child: const Text(
                  "Don't Have an Account? Sign up",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),),
    );
  }
}
