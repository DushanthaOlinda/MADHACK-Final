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
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: Text(announcementDetails.title),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: Text(announcementDetails.subtitle),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: Text(announcementDetails.description),
          ),
        ]),
      ),
    );
  }
}
