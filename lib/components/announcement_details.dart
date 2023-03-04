import 'package:flutter/material.dart';

class AnnouncementDetails extends StatelessWidget {
  const AnnouncementDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcement Details'),
        backgroundColor: Colors.black87,
      ),
      body: const Center(
        child: Text('Announcement Details'),
      ),
    );
  }
}