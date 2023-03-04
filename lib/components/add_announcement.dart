import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madhack_finals/components/pass.dart';

class AddAnnouncement extends StatefulWidget {
  const AddAnnouncement({Key? key}) : super(key: key);

  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}


class _AddAnnouncementState extends State<AddAnnouncement> {
  _AddAnnouncementState(){
    _announcementDetails = AnnouncementDetails();
  }
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  late AnnouncementDetails _announcementDetails;
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _subtitle = TextEditingController();
  final _description = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Announcement'),
        backgroundColor: Colors.black87,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Add Announcement',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _subtitle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Subtitle',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _description,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
            const SizedBox(height:20),
        TextField(
          controller: dateInput,
          //editing controller of this TextField
          decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today), //icon of text field
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
                print(
                  pickedDate);
              } //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
              DateFormat('yyyy-MM-dd').format(pickedDate);
              if (kDebugMode) {
                print(
                  formattedDate);
              } //formatted date output using intl package =>  2021-03-16
              setState(() {
                dateInput.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {}
          },
        ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed:(){
                if (_formKey.currentState!.validate()) {
                  AnnouncementDetails announcementDetails = AnnouncementDetails();
                  announcementDetails.title = _title.text;
                  announcementDetails.subtitle = _subtitle.text;
                  announcementDetails.description = _description.text;
                  announcementDetails.formattedDate = dateInput.text;

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) {
                    return Pass( announcementDetails: announcementDetails);
                  })
                  );
                }
              },
              child: const Text('Add Announcement'),
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
  late String formattedDate;
}
