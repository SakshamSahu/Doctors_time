import 'package:doctors_time/components/chat_tile.dart';
import 'package:doctors_time/constants.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static const String routeName = "chat-page";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor2,
        appBar: AppBar(
          title: Text(
            "Chats",
            style: TextStyle(fontSize: width * 0.055),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.012, horizontal: width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ChatTile(context, "Saksham Sahu", "Hola"),
                SizedBox(height: height * 0.012),
                ChatTile(context, "Sakshi Sahu", "Dasai"),
                SizedBox(height: height * 0.012),
                ChatTile(context, "Abhinay Prajapati", "Kesan ba"),
                SizedBox(height: height * 0.012),
                ChatTile(context, "Anurag Puri", "Hurr")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
