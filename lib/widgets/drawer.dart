// ignore_for_file: prefer_const_constructors

import 'package:doctors_time/pages/sign_in_page.dart';
import 'package:doctors_time/provider/my_auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  final String name, email;
  const MyDrawer({super.key, required this.name, required this.email});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<myAuthProvider>(context, listen: false);

    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(padding: EdgeInsets.zero, children: [
          Container(
            color: Colors.black,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                margin: EdgeInsets.zero,
                accountName: Text(widget.name),
                accountEmail: Text(widget.email),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(ap.userModel.profilePic),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              CupertinoIcons.doc,
              color: Colors.white,
            ),
            title: Text(
              "Portfolio",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              CupertinoIcons.bag,
              color: Colors.white,
            ),
            title: Text(
              "Messages",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              CupertinoIcons.globe,
              color: Colors.white,
            ),
            title: Text(
              "Appointments",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.bar_chart,
              color: Colors.white,
            ),
            title: Text(
              "Skill-Dev",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              CupertinoIcons.news,
              color: Colors.white,
            ),
            title: Text(
              "News",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              CupertinoIcons.phone,
              color: Colors.white,
            ),
            title: Text(
              "Contact Us",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Settings",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              ap.userSignOut().then((value) =>
                  Navigator.pushNamed(context, SigninPage.routeName));
            },
            leading: Icon(
              CupertinoIcons.power,
              color: Colors.white,
            ),
            title: Text(
              "Log Out",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
