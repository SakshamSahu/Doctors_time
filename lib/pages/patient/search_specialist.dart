import 'package:doctors_time/constants.dart';
import 'package:flutter/material.dart';

class SearchSpecialist extends StatefulWidget {
  const SearchSpecialist({super.key});
  static const String routeName = "search-specialist-page";

  @override
  State<SearchSpecialist> createState() => _SearchSpecialistState();
}

class _SearchSpecialistState extends State<SearchSpecialist> {
  final TextEditingController searchSpecialistDateController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchSpecialistDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor2,
        appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.black,
          title: Text(
            "Search Here",
            style: TextStyle(fontSize: width * 0.05),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.023, horizontal: width * 0.035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Search Your",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: height * 0.002),
              const Text(
                "Specialist",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.03),
              Text("Select Work Order"),
              TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.pin),
                  border: OutlineInputBorder(),
                  labelText: 'Area',
                ),
              ),
              SizedBox(height: height * 0.03),
              TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.local_hospital),
                  border: OutlineInputBorder(),
                  labelText: 'Doctor/Specialist',
                ),
              ),
              SizedBox(height: height * 0.03),
              TextFormField(
                controller: searchSpecialistDateController,
                onTap: () => _selectDate(),
                readOnly: true,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(),
                  labelText: 'Select Date',
                ),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
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
      searchSpecialistDateController.text = _picked.toString().split(" ")[0];
    }
  }
}
