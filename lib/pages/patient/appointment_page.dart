import 'package:doctors_time/components/appointment_card.dart';
import 'package:doctors_time/constants.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});
  static const String routeName = "appointment-page";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgcolor2,
      appBar: AppBar(
        title: Text(
          "Appointments",
          style: TextStyle(fontSize: width * 0.055),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.023, horizontal: width * 0.035),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              appointmentCard(context, 0),
              SizedBox(height: height * 0.02),
              appointmentCard(context, 0),
              SizedBox(height: height * 0.02),
              appointmentCard(context, 0),
            ],
          ),
        ),
      ),
    );
  }
}
