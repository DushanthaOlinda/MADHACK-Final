import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madhack_finals/components/card.dart';

import '../../components/add_announcement.dart';
import '../login/login_screen.dart';

class Home2 extends StatefulWidget {
  Home2({super.key});

  String uid = "";
  String userEmail ="";
  String userName="";



  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> {

  final _auth = FirebaseAuth.instance;

  List<String> announcement = ["SCS2202", "SCS2208", "SCS2214"];

  List<String> announcementDetails = [
    "King Size Bed",
    "King SIe Sofa",
    "Wooden Chair"
  ];

  @override
  Widget build(BuildContext context) {
    final loggedInUser = _auth.currentUser!;
    widget.uid = loggedInUser.uid!;
    widget.userEmail = loggedInUser.email!;

    final CollectionReference users = FirebaseFirestore.instance.collection('users');
    final userDoc = users.doc(widget.uid).get();

    userDoc.then((DocumentSnapshot documentSnapshot){
      if(documentSnapshot.exists){
        final userData = documentSnapshot.data() as Map<String, dynamic>;
        widget.userName = userData['full_name'];
        print('User data: ${userData}');
        print(widget.userName.toString());
      }
      else{
        print('user does not exist');
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // push to the add announcement page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAnnouncement(),
            ),);
        },
        backgroundColor: Colors.black87,
        foregroundColor: Colors.blue,
        elevation: 0,
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        //   side: const BorderSide(color: Colors.blue, width: 2.0,style: BorderStyle.solid),
        // ),
        // mini: true,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        color: Colors.black87,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
                color: Colors.blue,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        title: const Text("Announcements"),
        actions: const [
          IconButton(
            icon: Icon(Icons.menu_book),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.edit_document),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        // flexibleSpace: const Image(image: AssetImage("images/bug.png"), fit: BoxFit.cover),
      ),
      drawer: Drawer(
          elevation: 140.0,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountEmail: Text(widget.userEmail),
                accountName: Text(widget.userName.toString()),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/bug.png"),
                ),
                otherAccountsPictures: const [
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
                leading: const Icon(Icons.date_range_rounded),
                title: const Text("Schedule"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Logout"),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
              // const Padding(
              //   padding: EdgeInsets.all(14.0),
              //   child: Text("Labels"),
              // ),
              // ListTile(
              //   leading: const Icon(Icons.label),
              //   title: const Text("Red"),
              //   onTap: () {},
              // ),
              // ListTile(
              //   leading: const Icon(Icons.label),
              //   title: const Text("Blue"),
              //   onTap: () {},
              // ),
              // ListTile(
              //   leading: const Icon(Icons.label),
              //   title: const Text("Green"),
              //   onTap: () {},
              // ),
            ],
          )),
      body: ListView.builder(
        itemCount: announcement.length,
        itemBuilder: (context, index) {
          return CardRender(
              title: announcement[index].toString(),
              subtitle: announcementDetails[index].toString());
        },
      ),
    );
  }
}
