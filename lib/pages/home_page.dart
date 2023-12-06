import 'package:doctors_time/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = "home-page";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor2,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.023, horizontal: width * 0.035),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Find Your",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: height * 0.002),
                      const Text(
                        "Specialist",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: width * 0.08),
                      Icon(Icons.chat_rounded),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
