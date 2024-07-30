import 'package:doctors_time/constants.dart';
import 'package:doctors_time/razorpay/razorpay.dart';

import 'package:doctors_time/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});
  static const String routeName = "book-appointment-page";

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final TextEditingController appointmentDateController =
      TextEditingController();
  final TextEditingController patientName = TextEditingController();
  final TextEditingController patientAge = TextEditingController();
  final TextEditingController patientGender = TextEditingController();

  final RazorPayIntegration _razorPayIntegration = RazorPayIntegration();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorPayIntegration.initiateRazorPay();
  }

  @override
  void dispose() {
    super.dispose();
    appointmentDateController.dispose();
    patientAge.dispose();
    patientGender.dispose();
    patientName.dispose();
  }

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
          "Book Appointment",
          style:
              TextStyle(fontSize: width * 0.052, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.023, horizontal: width * 0.035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: appointmentDateController,
                onTap: () => _selectDate(),
                readOnly: true,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(),
                  labelText: 'Select Date',
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                " Select Time",
                style: TextStyle(
                    fontSize: 16 * width * 0.0027,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5),
              ),
              SizedBox(height: height * 0.01),
              SizedBox(
                height: height * 0.2,
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: height * 0.02),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: (width * 0.1) / (height * 0.02),
                  crossAxisCount: 4,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kPrimaryColor,
                      ),
                      height: height * 0.01,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        "10:00 AM",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: kPrimaryColor,
                        ),
                        height: height * 0.01,
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          '10:30 AM',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        )),
                    Container(
                      height: height * 0.01,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kPrimaryColor,
                      ),
                      child: const Text(
                        '11:00 AM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    Container(
                      height: height * 0.01,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kPrimaryColor,
                      ),
                      child: const Text(
                        '11:30 AM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    Container(
                      height: height * 0.01,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kPrimaryColor,
                      ),
                      child: const Text(
                        '12:00 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    Container(
                      height: height * 0.01,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kPrimaryColor,
                      ),
                      child: const Text(
                        '12:30 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    Container(
                      height: height * 0.01,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kPrimaryColor,
                      ),
                      child: const Text(
                        '01:00 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    Container(
                      height: height * 0.01,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kPrimaryColor,
                      ),
                      child: const Text(
                        '01:30 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    Container(
                      height: height * 0.01,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kPrimaryColor,
                      ),
                      child: const Text(
                        '02:00 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                " Patient Details",
                style: TextStyle(
                    fontSize: 16 * width * 0.0027,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5),
              ),
              SizedBox(height: height * 0.025),
              customTextFormField(context, "Name", patientName),
              SizedBox(height: height * 0.025),
              customTextFormField(context, "Age", patientAge),
              SizedBox(height: height * 0.025),
              customTextFormField(context, "Gender", patientGender),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.03),
        child: SizedBox(
          height: height * 0.06,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                _razorPayIntegration.openCheckOut();
              },
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                  horizontal: width * 0.036,
                )),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2025));
    if (_picked != null) {
      appointmentDateController.text = _picked.toString().split(" ")[0];
    }
  }
}
