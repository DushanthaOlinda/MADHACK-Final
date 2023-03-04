import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madhack_finals/screens/login/login_screen.dart';
import 'package:madhack_finals/screens/login/components/background.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final registerFormKey = GlobalKey<FormState>();
  String fullName = "";
  String email = "";
  String password = "";

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
                        fullName = value!;
                        if (fullName.isEmpty) {
                          return "full name required";
                        } else {
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
                  SizedBox(height: size.height * 0.03),
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
                          return "Password must be 8 characters long and should contain at least one uppercase letter, lowercase letter and one digit";
                        } else {
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

                  if (registerFormKey.currentState!.validate()) {
                    bool isValidUser = false;
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);

                      if (newUser != null) {
                        print("working");
                        isValidUser = true;
                      }
                    } catch (e) {
                      print(e);
                    }

                    if (isValidUser == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Successfully logged in!'),
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
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Registration failed! Try again'),
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
