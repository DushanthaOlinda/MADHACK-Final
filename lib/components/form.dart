import 'package:flutter/material.dart';

class customForm extends StatefulWidget {
  const customForm({super.key});

  @override
  customFormState createState() {
    return customFormState();
  }
}

class customFormState extends State<customForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Invalid value';
              }
              return null;
            },
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: null,
                child: null,
              )
          )
        ],
      ),
    )
    );
  }
}
