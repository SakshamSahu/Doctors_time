import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget ChatTile(BuildContext context, String name, String msg) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () {},
    child: Container(
      height: height * 0.088,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage("assets/images/doc2.jpg"),
              radius: width * 0.087,
            ),
            SizedBox(width: width * 0.04),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: width * 0.042,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: height * 0.008),
                      Text(
                        msg,
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "05:45 AM",
                        style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "06-05-2002",
                        style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
