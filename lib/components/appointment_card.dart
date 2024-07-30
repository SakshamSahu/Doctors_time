import 'package:doctors_time/widgets/button_1.dart';
import 'package:flutter/material.dart';

Widget appointmentCard(BuildContext context, int index) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: height * 0.015, horizontal: width * 0.035),
    width: double.infinity,
    height: height * 0.19,
    decoration: BoxDecoration(
        color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontSize: width * 0.04),
            ),
            Text(
              "12/10/2024",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: width * 0.04),
            ),
            SizedBox(height: height * 0.05),
            Text(
              "Type",
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontSize: width * 0.04),
            ),
            Text(
              "Dentist",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: width * 0.04),
            )
          ],
        ),
        SizedBox(width: width * 0.06),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time",
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontSize: width * 0.04),
            ),
            Text(
              "10:30 PM",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: width * 0.04),
            ),
            SizedBox(height: height * 0.05),
            Text(
              "Place",
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontSize: width * 0.04),
            ),
            Text(
              "City Clinic",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: width * 0.04),
            )
          ],
        ),
        SizedBox(width: width * 0.06),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Doctor",
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontSize: width * 0.04),
            ),
            Text(
              "Dr. Adam Smith",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: width * 0.04),
            ),
            SizedBox(height: height * 0.05),
            CustomButton(text: "Cancel", onPressed: () {})
          ],
        )
      ],
    ),
  );
}
