import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});
  final List<Map<String, dynamic>> subjects = [    {      'name': 'Programming',      'image': 'assets/images/programming.jpg',    },    {      'name': 'Web Development',      'image': 'assets/images/Web-Development.jpg',    },    {      'name': 'OOP Concept',      'image': 'assets/images/oop.png',    },    {      'name': 'Database',      'image': 'assets/images/database.png',    },    {      'name': 'BPM',      'image': 'assets/images/bpm.png',    },    {      'name': 'BPR',      'image': 'assets/images/bpr.jpg',    },  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),

      ),
      drawer: Drawer(
          elevation: 140.0,
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountEmail: Text("dushanthaolinda29@gmail.com"),
                accountName: Text("Dushantha Olinda"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/bug.png"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/bug.png"),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/bug.png"),
                  )
                ],
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text("Cart"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {},
              ),
            ],
          )),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: subjects.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubjectDetailsPage(
                          subject: subjects[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          subjects[index]['image'],
                          height: 100.0,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          subjects[index]['name'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SubjectDetailsPage extends StatelessWidget {
  final Map<String, dynamic> subject;

  const SubjectDetailsPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject['name']),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  subject['image'],
                  height: 200.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                subject['name'],
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Subject details go here.',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Sessions:',
                style: TextStyle(fontSize: 24.0),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: subject['sessions'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 16.0),
                        Text(
                          subject['sessions'][index]['title'],
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Date: ${subject['sessions'][index]['date']}',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'Resources:',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          subject['sessions'][index]['resources'],
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}