import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget specialitiesTile(BuildContext context, String name, String path) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () {},
    child: Container(
      height: height * 0.11,
      width: width * 0.26,
      decoration: BoxDecoration(
          color: const Color(0XFF0217A8),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            path,
            height: height * 0.05,
          ),
          SizedBox(height: height * 0.01),
          Text(
            name,
            style: TextStyle(
                fontSize: width * 0.031,
                color: Colors.white,
                fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
