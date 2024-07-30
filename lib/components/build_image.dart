import 'package:flutter/material.dart';

final urlImages = [
  "https://www.shutterstock.com/image-vector/woman-doctor-icon-female-physician-600nw-415771162.jpg",
  "https://i.pinimg.com/564x/41/01/55/4101551ae72acdbc52ccff4bde6e4dc0.jpg",
  "https://img.lovepik.com/element/45000/4103.png_860.png",
  "https://p7.hiclipart.com/preview/909/609/220/physician-illustration-male-doctor-icon.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkvzjwWR8O1CmK5PrmfzLZRGwRcs9HmlPpjA&usqp=CAU",
];
final popularCourses = [
  "Oncologists",
  "Neurologists",
  "Hematologists",
  "Dental Surgeon",
  "Opthalmologists"
];

Widget buildImage(BuildContext context, String urlImage, int index) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () {},
    child: Container(
        width: width * 0.8,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(urlImage),
          ),
        ),
        alignment:
            Alignment.bottomCenter, // This aligns the child of the container
        child: Padding(
            padding: const EdgeInsets.only(
                bottom: 0.0), //some spacing to the child from bottom
            child: Container(
              width: double.infinity,
              height: height * 0.04,
              decoration: BoxDecoration(
                color: const Color(0XFF0217A8).withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  popularCourses[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
              ),
            ))),
  );
}
