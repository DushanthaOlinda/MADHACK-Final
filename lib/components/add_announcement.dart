import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madhack_finals/components/pass.dart';
import 'package:madhack_finals/constants.dart';

class AddAnnouncement extends StatefulWidget {

  AddAnnouncement({super.key});

  String kuppiSubject = "";
  String kuppinResPerson = "";
  String date ="";
  String time = "";

  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
  _AddAnnouncementState() {
    _announcementDetails = AnnouncementDetails();
  }

  @override
  void initState() {
    _dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  late AnnouncementDetails _announcementDetails;
  final _formKey = GlobalKey<FormState>();

  final _subject = TextEditingController();
  final _resourcePerson = TextEditingController();
  final _dateInput = TextEditingController();
  final _timeInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Kuppi'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Add New Kuppi',
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
                  labelText: 'Subject',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "subject required";
                  } else {
                    widget.kuppiSubject = value!;
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                controller: _resourcePerson,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Resource Person',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "resource person required";
                  } else {
                    widget.kuppinResPerson = value!;
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                controller: _dateInput,
                //editing controller of this TextField
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    if (kDebugMode) {
                      print(pickedDate);
                    } //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    if (kDebugMode) {
                      print(formattedDate);
                    } //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      _dateInput.text = formattedDate;
                      _dateInput.value =formattedDate as TextEditingValue;
                    });
                  } else {

                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "date required";
                  } else {
                    widget.date = value!;
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                controller: _timeInput,
                //editing controller of this TextField
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.access_time),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: "Enter Time" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (pickedTime != null) {
                    if (kDebugMode) {
                      print(pickedTime);
                    }
                    String formattedTime = TimeOfDay(
                            hour: pickedTime.hour, minute: pickedTime.minute)
                        .format(context);
                    if (kDebugMode) {
                      print(formattedTime);
                      setState(() {
                        _timeInput.text = formattedTime; //set output date to TextField value.
                        _timeInput.value = formattedTime as TextEditingValue;
                      });
                    } else {}
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "time required";
                  } else {
                    widget.time = value!;
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
                  final CollectionReference kuppiSchedules = FirebaseFirestore.instance.collection('kuppi_schedules');
                  final kuppiDoc = kuppiSchedules.doc();

                  final kuppi = {
                    'subject': widget.kuppiSubject,
                    'resource_person': widget.kuppinResPerson,
                    'date': widget.date,
                    'time': widget.time,
                    'id': kuppiDoc.id,
                  };

                  // add kuppi data to document
                  await kuppiDoc.set(kuppi);

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

class AnnouncementDetails {
  late String title;
  late String subtitle;
  late String description;
}
