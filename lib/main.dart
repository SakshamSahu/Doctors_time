import 'package:doctors_time/firebase_options.dart';
import 'package:doctors_time/pages/doctor/doctor_home_page.dart';
import 'package:doctors_time/pages/get_started_page.dart';
import 'package:doctors_time/provider/doctor_provider.dart';
import 'package:doctors_time/provider/my_auth_provider.dart';
import 'package:doctors_time/provider/patient_provider.dart';
import 'package:doctors_time/services/firestore_service.dart';
import 'package:doctors_time/utils/routes/app_routes.dart';
import 'package:doctors_time/widgets/bottom_navigation_bar.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => myAuthProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => PatientProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        initialRoute: "/",
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            return FutureBuilder(
                future:
                    FirestoreService().getRoleFromFirebase(snapshot.data!.uid),
                builder: (context, snapshot) {
                  if (snapshot.data == "doctor") {
                    return const DoctorHomePage();
                  } else {
                    return const BottomNavigationExample();
                  }
                });
          } else {
            return const GetStartedPage();
          }
        }
      },
    );
  }
}
