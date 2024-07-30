import 'package:doctors_time/constants.dart';
import 'package:doctors_time/models/AvailableDoctor.dart';
import 'package:doctors_time/pages/patient/book_appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key});
  static const String routeName = "doctor-details-page";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        appBar: AppBar(
            title: Text("About", style: TextStyle(fontSize: width * 0.055))),
        backgroundColor: bgcolor2,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.015, horizontal: width * 0.035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.015, horizontal: width * 0.035),
                width: double.infinity,
                height: height * 0.23,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          demoAvailableDoctors[index].name!,
                          style: TextStyle(
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Text(
                          demoAvailableDoctors[index].sector!,
                          style: TextStyle(
                              fontSize: width * 0.05, color: Colors.white),
                        ),
                        SizedBox(height: height * 0.01),
                        RatingBar.builder(
                            initialRating: 5,
                            itemSize: 25,
                            direction: Axis.horizontal,
                            itemBuilder: ((context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                )),
                            onRatingUpdate: (rating) {}),
                        SizedBox(height: height * 0.033),
                        Text(
                          " MBBS, BFMS ",
                          style: TextStyle(
                              fontSize: width * 0.038, color: Colors.white),
                        ),
                        Text(
                          " ${demoAvailableDoctors[index].name!}@doctor.com ",
                          style: TextStyle(
                              fontSize: width * 0.028, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(width: width * 0.02),
                    SizedBox(
                        width: width * 0.29,
                        height: height * 0.19,
                        child: Image.asset(
                          demoAvailableDoctors[index].image!,
                          fit: BoxFit.fitHeight,
                        ))
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.28,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: width * 0.025, vertical: 0)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.call,
                              size: width * 0.04,
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              "Voice Call",
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        )),
                  ),
                  //SizedBox(width: width * 0.02),
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.28,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: width * 0.025, vertical: 0)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.video_call,
                              size: width * 0.04,
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              "Video Call",
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        )),
                  ),
                  //SizedBox(width: width * 0.02),
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.28,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: width * 0.036, vertical: 0)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.message,
                              size: width * 0.04,
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              "Message",
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        )),
                  )
                ],
              ),
              SizedBox(height: height * 0.02),
              Text(
                "About ${demoAvailableDoctors[index].name}",
                style: TextStyle(
                    fontSize: width * 0.04, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.015),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                style: TextStyle(fontSize: width * 0.039),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "Clinic",
                style: TextStyle(
                    fontSize: width * 0.04, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  const Icon(CupertinoIcons.location_solid),
                  SizedBox(width: width * 0.01),
                  Text(
                    " 03, Outside datia gate, Jhansi ",
                    style: TextStyle(fontSize: width * 0.039),
                  ),
                ],
              ),
              SizedBox(height: height * 0.015),
              Text(
                "Degree",
                style: TextStyle(
                    fontSize: width * 0.04, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  const Icon(Icons.school),
                  SizedBox(width: width * 0.015),
                  Text(
                    " MBBS, BFMS ",
                    style: TextStyle(fontSize: width * 0.039),
                  ),
                ],
              ),
              SizedBox(height: height * 0.015),
              Text(
                "Institute",
                style: TextStyle(
                    fontSize: width * 0.04, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  const Icon(CupertinoIcons.building_2_fill),
                  SizedBox(width: width * 0.015),
                  Text(
                    " Medical College Bundelkhand",
                    style: TextStyle(fontSize: width * 0.039),
                  ),
                ],
              ),
              SizedBox(height: height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Experience",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "${demoAvailableDoctors[index].experience} Years",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patients",
                        style: TextStyle(
                            fontSize: width * (0.04),
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        demoAvailableDoctors[index].patients!,
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reviews",
                        style: TextStyle(
                            fontSize: width * (0.04),
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "2.05K",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.03),
          child: SizedBox(
            height: height * 0.06,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, BookAppointmentScreen.routeName);
                },
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    horizontal: width * 0.036,
                  )),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                child: Text(
                  "Book an Appointment",
                  style: TextStyle(
                      fontSize: width * 0.04, fontWeight: FontWeight.w900),
                )),
          ),
        ));
  }
}
