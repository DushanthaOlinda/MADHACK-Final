import 'package:flutter/material.dart';
import 'package:madhack_finals/components/add_announcement.dart';

class Pass extends StatelessWidget {
  const Pass({Key? key, required this.announcementDetails}) : super(key: key);

  final AnnouncementDetails announcementDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pass'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children:  [
          ListTile(
            leading: const Icon(Icons.title),
            title: Text(announcementDetails.title),
          ),
          ListTile(
            leading: const Icon(Icons.subtitles),
            title: Text(announcementDetails.subtitle),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: Text(announcementDetails.description),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: Text(announcementDetails.formattedDate.toString()),
          ),
          ListTile(
            leading: const Icon(Icons.alarm),
            title: Text(announcementDetails.formattedTime.toString()),
          ),
        ]),
      ),
    );
  }
}
