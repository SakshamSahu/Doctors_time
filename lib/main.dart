import 'package:doctors_time/firebase_options.dart';
import 'package:doctors_time/pages/get_started_page.dart';
import 'package:doctors_time/pages/home_page.dart';
import 'package:doctors_time/provider/my_auth_provider.dart';
import 'package:doctors_time/utils/routes/app_routes.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: GetStartedPage.routeName,
        routes: AppRoutes.routes,
      ),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   const AuthenticationWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<myAuthProvider>(context);

//     return StreamBuilder<User?>(
//       stream: authProvider.authStateChanges,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else {
//           if (snapshot.hasData) {
//             // User is logged in, navigate to home page
//             return HomePage();
//           } else {
//             // User is not logged in, navigate to get started page
//             return GetStartedPage();
//           }
//         }
//       },
//     );
//   }
// }
