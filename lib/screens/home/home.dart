import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../login/login_screen.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);
  @override
  State<Home2> createState() => _HomeState();
}

  class _HomeState extends State<Home2> {
  List<String> products = ["Bed", "Sofa", "Chair"];

  List<String> productDetails = [
  "King Size Bed",
  "King SIe Sofa",
  "Wooden Chair"
  ];

  List<int> price = [3000, 2500, 1860];

  @override
  Widget build(BuildContext context) {
    final loggedInUser = FirebaseAuth.instance.currentUser!;
    String userEmail = loggedInUser.email!;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
        child: Container(
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
        title: const Text("Dashboard"),
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
                accountEmail: Text(userEmail),
                accountName: Text("Admin"),
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
      body: Container(
        // padding: const EdgeInsets.all(20.0),
        // margin: const EdgeInsets.only(top: 90.0),
        // child: Column(
        //   children: [
        //     Row(
        //       children:const [
        //         Expanded(child: Image(image: AssetImage("images/bug.png"),width: 100,)),
        //         Expanded(flex:2, child: Image(image: AssetImage("images/bug.png"),width: 100,)),
        //         Expanded(child: Image(image: AssetImage("images/bug.png"),width: 100,)),
        //       ]
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: const [
        //         Icon(Icons.star),
        //         Icon(Icons.star),
        //         Icon(Icons.star),
        //         Icon(Icons.star_border),
        //         Icon(Icons.star_border),
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children:[
        //         Column(
        //           children:const [
        //             Icon(Icons.phone,size: 35.0,),
        //             Text("phone"),
        //           ],
        //         ),
        //         Column(
        //           children:const [
        //             Icon(Icons.alt_route,size: 35.0,),
        //             Text("route"),
        //           ],
        //         ),
        //         Column(
        //           children:const [
        //             Icon(Icons.share,size: 35.0,),
        //             Text("share"),
        //           ],
        //         ),
        //       ]
        //     ),
        //   ],
        // ),
        // child: ListView(
        //   itemExtent: 70.0,
        //   // reverse: true,
        //   // scrollDirection: Axis.horizontal,
        //   children:const [
        //     ListTile(
        //       leading: CircleAvatar(child: Icon(Icons.alarm_on_sharp)),
        //       title: Text("Sales"),
        //       subtitle: Text("Sales of the week"),
        //       trailing: Text("3500"),
        //       // onTap: null,
        //     ),
        //     ListTile(
        //       leading: CircleAvatar(child: Icon(Icons.people)),
        //       title: Text("Customers"),
        //       subtitle: Text("Total customers"),
        //       trailing: Text("150"),
        //       // onTap: null,
        //     ),
        //     ListTile(
        //       leading: CircleAvatar(child: Icon(Icons.alarm_on_sharp)),
        //       title: Text("Profit"),
        //       subtitle: Text("Profit of the week"),
        //       trailing: Text("2000"),
        //       // onTap: null,
        //     ),
        //   ]
        // )
          child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(products[index][0]),
                  ),
                  title: Text(products[index]),
                  subtitle: Text(productDetails[index]),
                  trailing: Text(price[index].toString()),
                  onTap: () {},
                );
              })),
    );
  }
}
