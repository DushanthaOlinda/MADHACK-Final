import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madhack_finals/constants.dart';

class AddSubject extends StatefulWidget {

  AddSubject({super.key});

  String subjectName = "";
  String description = "";
  String imageLocation = "";

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  File? image;

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if(image==null){
  //       return;
  //     }
  //
  //     final tempImage = File(image.path);
  //
  //     setState(() {
  //       this.image = tempImage;
  //     });
  //   }
  //   on PlatformException catch (e) {
  //     print(e);
  //   }
  // }


  @override
  void initState() {
    _imageInput.text = ""; //set the initial value of text field
    super.initState();
  }

  late AddSubject _subjectDetails;
  final _formKey = GlobalKey<FormState>();

  final _subject = TextEditingController();
  final _description = TextEditingController();
  final _imageInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Subject'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Add New Subject',
              style: TextStyle(
                color: primaryLight,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                controller: _subject,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Subject Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "subject name required";
                  } else {
                    widget.subjectName = value!;
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                controller: _description,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "description required";
                  } else {
                    widget.description = value!;
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                controller: _imageInput,
                //editing controller of this TextField
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.image),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: "Upload Image" //label text of field
                ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  try {
                    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if(image!=null){
                      final tempImage = File(image.path);
                      print(tempImage);
                      String formatedFile = tempImage.toString();

                      setState(() {
                        this.image = tempImage;
                        _imageInput.text = tempImage.path;
                        _imageInput.value = tempImage.path as TextEditingValue;
                      });
                    }
                    else{

                    }
                  }
                  on PlatformException catch (e) {
                    print(e);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "image file required";
                  } else {
                    widget.imageLocation = value!;
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final formIsValid = _formKey.currentState!.validate();

                if(formIsValid){
                  // final CollectionReference subjects = FirebaseFirestore.instance.collection('subjects');
                  // final subjectDoc = subjects.doc();
                  //
                  // final subject = {
                  //   'name': widget.subjectName,
                  //   'description': widget.description,
                  //   'image': widget.imageLocation,
                  //   'id': subjectDoc.id,
                  // };
                  //
                  // // add kuppi data to document
                  // await subjectDoc.set(subject);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                          'Kuppi scheduled!'),
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

                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectDetails {
  late String title;
  late String subtitle;
  late String description;
}