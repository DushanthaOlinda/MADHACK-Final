import 'package:flutter/material.dart';

import 'announcement_details.dart';

//imported google's material design library
class CardRender extends StatelessWidget {
  const CardRender({Key? key, required this.title, required this.subtitle}) : super(key: key);

  final String title;
  final String subtitle;

@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              constraints: const BoxConstraints(maxWidth: 300),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.announcement),
                  title: Text(title),
                  subtitle: Text(subtitle),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnnouncementDetails(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
