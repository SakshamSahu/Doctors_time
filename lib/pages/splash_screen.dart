import 'package:doctors_time/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "splash-page";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(const Duration(milliseconds: 3000), () {
      //exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const AuthenticationWrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Stack(
        children: [
          //app logo
          AnimatedPositioned(
              duration: const Duration(seconds: 1),
              top: height * 0.22,
              right: width * 0.25,
              width: width * 0.5,
              child: Image.asset("assets/images/healthcare.png")),
          //google login button
          Positioned(
              bottom: height * 0.15,
              width: width,
              child: const Text(
                "Made In India With ❤️",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 19,
                    letterSpacing: 2,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              )),
        ],
      ),
    );
  }
}
