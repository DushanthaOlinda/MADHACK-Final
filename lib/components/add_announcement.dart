import 'package:flutter/material.dart';
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

  late AnnouncementDetails _announcementDetails;
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _subtitle = TextEditingController();
  final _description = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Announcement'),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Form(
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
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed:(){
                  if (_formKey.currentState!.validate()) {
                    AnnouncementDetails announcementDetails = AnnouncementDetails();
                    announcementDetails.title = _title.text;
                    announcementDetails.subtitle = _subtitle.text;
                    announcementDetails.description = _description.text;

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
      ),
    );
  }
}

class AnnouncementDetails {
  late String title;
  late String subtitle;
  late String description;
}
