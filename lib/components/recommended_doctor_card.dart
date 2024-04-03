import 'package:doctors_time/models/RecommendDoctor.dart';
import 'package:flutter/material.dart';

Widget recommendeddoctorcard(BuildContext context, int index) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: height * 0.015, horizontal: width * 0.035),
    width: width * 0.71,
    height: height * 0.23,
    decoration: BoxDecoration(
        color: Colors.white60, borderRadius: BorderRadius.circular(8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              demo_recommended_doctor[index].name,
              style: TextStyle(
                  fontSize: width * 0.0455, fontWeight: FontWeight.w400),
            ),
            Text(
              demo_recommended_doctor[index].speciality,
              style: TextStyle(fontSize: width * 0.034),
            ),
            SizedBox(height: height * 0.075),
            // RatingBar.builder(
            //     initialRating: 5,
            //     itemSize: 13,
            //     direction: Axis.horizontal,
            //     itemBuilder: ((context, index) => const Icon(
            //           Icons.star,
            //           color: Colors.amber,
            //         )),
            //     onRatingUpdate: (rating) {}),
            // SizedBox(height: height * 0.015),
            Text(
              "Institute",
              style: TextStyle(
                  fontSize: width * 0.036, fontWeight: FontWeight.w300),
            ),
            Text(
              demo_recommended_doctor[index].institute,
              style: TextStyle(
                  fontSize: width * 0.035, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: height * 0.015),
          ],
        ),
        SizedBox(
            width: width * 0.25,
            height: height * 0.18,
            child: Image.asset(
              demo_recommended_doctor[index].image,
              fit: BoxFit.fitHeight,
            ))
      ],
    ),
  );
}
