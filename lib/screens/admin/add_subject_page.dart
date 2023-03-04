import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';


class AddSubjectPage extends StatefulWidget {
  @override
  _AddSubjectPageState createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _descriptionController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Subject'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Subject Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a subject name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    final subject = {
                      'name': _nameController.text,
                      'image': _imageUrlController.text,
                      'description': _descriptionController.text,
                    };
                    await FirebaseFirestore.instance
                        .collection('subjects')
                        .add(subject);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black87,
        foregroundColor: Colors.yellow,
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
                color: Colors.yellow,
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
        title: const Text("Home"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.purple.withOpacity(0.7),
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
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text("Labels"),
              ),
              ListTile(
                leading: const Icon(Icons.label),
                title: const Text("Red"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.label),
                title: const Text("Blue"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.label),
                title: const Text("Green"),
                onTap: () {},
              ),
            ],
          )),
      body: Container(
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
