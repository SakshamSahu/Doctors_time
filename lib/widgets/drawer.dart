// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  final String name, email;
  const MyDrawer({super.key, required this.name, required this.email});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    const imageURL =
        "https://e0.pxfuel.com/wallpapers/900/942/desktop-wallpaper-cartoon-cartoon-new-cartoon-boy-cartoon-letest-cartoon-cute-cartoon-cute-bay-cartoon-kartoon-thumbnail.jpg";
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
                  backgroundImage: NetworkImage(imageURL),
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
              textScaleFactor: 1.2,
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
              textScaleFactor: 1.2,
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
              "Opportunities",
              textScaleFactor: 1.2,
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
              "Applications",
              textScaleFactor: 1.2,
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
              textScaleFactor: 1.2,
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
              textScaleFactor: 1.2,
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
              textScaleFactor: 1.2,
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
              textScaleFactor: 1.2,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              CupertinoIcons.power,
              color: Colors.white,
            ),
            title: Text(
              "Log Out",
              textScaleFactor: 1.2,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
