// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:madhack_finals/screens/admin/add_subject_page.dart';
//
// import '../login/login_screen.dart';
//
// class SubjectDetailsScreen extends StatefulWidget {
//   SubjectDetailsScreen({super.key});
//
//   String uid = "";
//   String userEmail ="";
//   String userName="";
//
//   final List<Map<String, dynamic>> subjects = [    {      'name': 'Programming',      'image': 'assets/images/programming.jpg',    },    {      'name': 'Web Development',      'image': 'assets/images/Web-Development.jpg',    },    {      'name': 'OOP Concept',      'image': 'assets/images/oop.png',    },    {      'name': 'Database',      'image': 'assets/images/database.png',    },    {      'name': 'BPM',      'image': 'assets/images/bpm.png',    },    {      'name': 'BPR',      'image': 'assets/images/bpr.jpg',    },  ];
//
//   @override
//   State<SubjectDetailsScreen> createState() => _SubjectDetailsScreenState();
// }
//
// class _SubjectDetailsScreenState extends State<SubjectDetailsScreen> {
//   final _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     final loggedInUser = _auth.currentUser!;
//     widget.uid = loggedInUser.uid!;
//     widget.userEmail = loggedInUser.email!;
//
//     // final CollectionReference users = FirebaseFirestore.instance.collection('users');
//     // final DocumentSnapshot userDoc = await users.doc(loggedInUser.uid!).get();
//     //
//     // if (userDoc.exists && userDoc.data() != null) {
//     // final Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Subject'),
//
//       ),
//       drawer: Drawer(
//           elevation: 140.0,
//           child: ListView(
//             children: [
//               UserAccountsDrawerHeader(
//                 accountEmail: Text(widget.userEmail),
//                 accountName: Text("John Doe"),
//                 currentAccountPicture: const CircleAvatar(
//                   backgroundImage: AssetImage("assets/images/bug.png"),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.home),
//                 title: const Text("Home"),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: const Icon(Icons.date_range_rounded),
//                 title: const Text("Schedule"),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: const Icon(Icons.person),
//                 title: const Text("Profile"),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: const Icon(Icons.exit_to_app),
//                 title: const Text("Logout"),
//                 onTap: () {
//                   FirebaseAuth.instance.signOut();
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LoginScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           )),
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Center(
//                 child: Image.asset(
//                   subject['image'],
//                   height: 200.0,
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               Text(
//                 subject['name'],
//                 style: const TextStyle(
//                   fontSize: 32.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               const Text(
//                 'Subject details go here.',
//                 style: TextStyle(fontSize: 24.0),
//               ),
//               const SizedBox(height: 16.0),
//               const Text(
//                 'Sessions:',
//                 style: TextStyle(fontSize: 24.0),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: subject['sessions'].length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         const SizedBox(height: 16.0),
//                         Text(
//                           subject['sessions'][index]['title'],
//                           style: const TextStyle(
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8.0),
//                         Text(
//                           'Date: ${subject['sessions'][index]['date']}',
//                           style: const TextStyle(fontSize: 18.0),
//                         ),
//                         const SizedBox(height: 8.0),
//                         const Text(
//                           'Resources:',
//                           style: TextStyle(fontSize: 18.0),
//                         ),
//                         const SizedBox(height: 8.0),
//                         Text(
//                           subject['sessions'][index]['resources'],
//                           style: const TextStyle(fontSize: 16.0),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }