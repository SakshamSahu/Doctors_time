import 'package:doctors_time/components/specialities_tile.dart';
import 'package:doctors_time/constants.dart';
import 'package:flutter/material.dart';

class AllSpecialitiesScreen extends StatelessWidget {
  const AllSpecialitiesScreen({super.key});
  static const String routeName = "all-specialities.dart";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Specialities",
          style:
              TextStyle(fontSize: width * 0.052, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.023, horizontal: width * 0.035),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.55,
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: height * 0.02),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: (width * 0.1) / (height * 0.04),
                  crossAxisCount: 3,
                  children: <Widget>[
                    specialitiesTile(context, "Cardiologist",
                        "assets/icons/Cardiologist.svg"),
                    specialitiesTile(context, "Neurosurgeon",
                        "assets/icons/Neurosurgeon.svg"),
                    specialitiesTile(context, "Pediatrician",
                        "assets/icons/Pediatrician.svg"),
                    specialitiesTile(context, "Psychiatrist",
                        "assets/icons/Psychiatrist.svg"),
                    specialitiesTile(
                        context, "Dentist", "assets/icons/dentist.svg"),
                    specialitiesTile(
                        context, "Gynecologist", "assets/icons/gynaecology.svg")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
