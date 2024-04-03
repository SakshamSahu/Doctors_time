import 'package:doctors_time/models/AvailableDoctor.dart';
import 'package:doctors_time/pages/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget availabledoctorcard(BuildContext context, int index) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, DoctorDetails.routeName, arguments: index);
    },
    child: Container(
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
                demoAvailableDoctors[index].name!,
                style: TextStyle(
                    fontSize: width * 0.0455, fontWeight: FontWeight.w400),
              ),
              Text(
                demoAvailableDoctors[index].sector!,
                style: TextStyle(fontSize: width * 0.034),
              ),
              SizedBox(height: height * 0.004),
              RatingBar.builder(
                  initialRating: 5,
                  itemSize: 13,
                  direction: Axis.horizontal,
                  itemBuilder: ((context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      )),
                  onRatingUpdate: (rating) {}),
              SizedBox(height: height * 0.015),
              Text(
                "Experience",
                style: TextStyle(
                    fontSize: width * 0.036, fontWeight: FontWeight.w300),
              ),
              Text(
                "${demoAvailableDoctors[index].experience} Years",
                style: TextStyle(
                    fontSize: width * 0.035, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: height * 0.015),
              Text(
                "Patients",
                style: TextStyle(
                    fontSize: width * (0.036), fontWeight: FontWeight.w300),
              ),
              Text(
                demoAvailableDoctors[index].patients!,
                style: TextStyle(
                    fontSize: width * 0.035, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
              width: width * 0.28,
              height: height * 0.18,
              child: Image.asset(
                demoAvailableDoctors[index].image!,
                fit: BoxFit.fitHeight,
              ))
        ],
      ),
    ),
  );
}
