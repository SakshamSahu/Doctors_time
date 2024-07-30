import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctors_time/components/available_doctor_card.dart';
import 'package:doctors_time/components/build_image.dart';
import 'package:doctors_time/components/recommended_doctor_card.dart';
import 'package:doctors_time/components/specialities_tile.dart';
import 'package:doctors_time/constants.dart';
import 'package:doctors_time/pages/patient/all_specialities.dart';
import 'package:doctors_time/pages/patient/search_specialist.dart';
import 'package:doctors_time/provider/patient_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = "home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<PatientProvider>(context, listen: false).pateintInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ref = Provider.of<PatientProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor2,
        body: ref.userModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Builder(
                builder: (context) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.015,
                            horizontal: width * 0.032),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Find Your",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: height * 0.002),
                                const Text(
                                  "Specialist",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0XFF0217A8)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, SearchSpecialist.routeName);
                                  },
                                  child: const Icon(
                                    CupertinoIcons.search,
                                    size: 29,
                                  ),
                                ),
                                SizedBox(width: width * 0.075),
                                const Icon(
                                  CupertinoIcons.bell,
                                  size: 28,
                                ),
                                SizedBox(width: width * 0.03),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width - 20,
                        child: Row(children: [
                          SizedBox(width: width * 0.02),
                          const Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.red,
                          ),
                          SizedBox(width: width * 0.01),
                          Expanded(
                            child: Text(
                              "${ref.userModel!.address}, ${ref.userModel!.city} - ${ref.userModel!.pincode}",
                              style: TextStyle(
                                fontSize: width * 0.034,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ]),
                      ),
                      SizedBox(height: height * 0.01),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.035),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CarouselSlider.builder(
                              itemCount: 3,
                              itemBuilder: (context, index, realIndex) {
                                return recommendeddoctorcard(context, index);
                                // return buildImage(context, urlImage, index);
                              },
                              options: CarouselOptions(
                                height: height * 0.25,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                autoPlayInterval: const Duration(seconds: 5),
                                viewportFraction: 0.8,
                              ),
                            ),
                            SizedBox(height: height * 0.035),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Specialities",
                                  style: TextStyle(
                                      fontSize: 15 * width * 0.0027,
                                      fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        AllSpecialitiesScreen.routeName);
                                  },
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        fontSize: 13 * width * 0.0027,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.015),
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.01,
                                    vertical: height * 0.008),
                                child: Row(
                                  children: [
                                    specialitiesTile(context, "Cardiologist",
                                        "assets/icons/Cardiologist.svg"),
                                    SizedBox(width: width * 0.02),
                                    specialitiesTile(context, "Neurosurgeon",
                                        "assets/icons/Neurosurgeon.svg"),
                                    SizedBox(width: width * 0.02),
                                    specialitiesTile(context, "Pediatrician",
                                        "assets/icons/Pediatrician.svg"),
                                    SizedBox(width: width * 0.02),
                                    specialitiesTile(context, "Psychiatrist",
                                        "assets/icons/Psychiatrist.svg"),
                                    SizedBox(width: width * 0.02),
                                    specialitiesTile(context, "Dentist",
                                        "assets/icons/dentist.svg"),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Available Doctors",
                                  style: TextStyle(
                                      fontSize: 15 * width * 0.0027,
                                      fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        fontSize: 13 * width * 0.0027,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.015),
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                    vertical: height * 0.01),
                                child: Row(
                                  children: [
                                    availabledoctorcard(context, 0),
                                    SizedBox(width: width * 0.03),
                                    availabledoctorcard(context, 1),
                                    SizedBox(width: width * 0.03),
                                    availabledoctorcard(context, 2),
                                    SizedBox(width: width * 0.03),
                                    availabledoctorcard(context, 3),
                                    SizedBox(width: width * 0.03),
                                    availabledoctorcard(context, 4)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recommended",
                                  style: TextStyle(
                                      fontSize: 15 * width * 0.0027,
                                      fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        fontSize: 13 * width * 0.0027,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.015),
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                    vertical: height * 0.01),
                                child: Row(
                                  children: [
                                    recommendeddoctorcard(context, 0),
                                    SizedBox(width: width * 0.03),
                                    recommendeddoctorcard(context, 1),
                                    SizedBox(width: width * 0.03),
                                    recommendeddoctorcard(context, 2),
                                    SizedBox(width: width * 0.03),
                                    recommendeddoctorcard(context, 3),
                                    SizedBox(width: width * 0.03),
                                    recommendeddoctorcard(context, 4),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
