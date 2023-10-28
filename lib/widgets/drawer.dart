import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final image =
      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlue),
              margin: EdgeInsets.all(0),
              accountName: Text("Pranshu Pandey"),
              accountEmail: Text("pranshupandey069@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text("Profile"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail),
            title: Text("Mail"),
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text("Privacy"),
          ),
        ],
      ),
    );
  }
}
