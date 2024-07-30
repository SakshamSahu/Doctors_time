import 'package:doctors_time/Pages/get_started_page.dart';
import 'package:doctors_time/pages/patient/all_specialities.dart';

import 'package:doctors_time/pages/patient/appointment_page.dart';
import 'package:doctors_time/pages/patient/book_appointment.dart';
import 'package:doctors_time/pages/patient/chat_page.dart';
import 'package:doctors_time/pages/patient/doctor_details.dart';
import 'package:doctors_time/pages/doctor/doctor_home_page.dart';
import 'package:doctors_time/pages/patient/home_page.dart';
import 'package:doctors_time/pages/patient/profile_page.dart';
import 'package:doctors_time/pages/patient/search_specialist.dart';
import 'package:doctors_time/pages/auth/sign_in_page.dart';
import 'package:doctors_time/pages/auth/sign_up_as.dart';
import 'package:doctors_time/pages/auth/sign_up_page_patient.dart';
import 'package:doctors_time/pages/auth/sign_up_page_doctor.dart';
import 'package:doctors_time/pages/splash_screen.dart';
import 'package:doctors_time/widgets/bottom_navigation_bar.dart';

class AppRoutes {
  static final routes = {
    "/": (context) => const SplashScreen(),
    GetStartedPage.routeName: (context) => const GetStartedPage(),
    SigninPage.routeName: (context) => const SigninPage(),
    SignupPage.routeName: (context) => const SignupPage(),
    SignupPageDoctor.routeName: (context) => const SignupPageDoctor(),
    HomePage.routeName: (context) => HomePage(),
    BottomNavigationExample.routeName: (context) =>
        const BottomNavigationExample(),
    SignUpAs.routeName: (context) => SignUpAs(),
    SearchSpecialist.routeName: (context) => const SearchSpecialist(),
    ProfilePage.routeName: (context) => const ProfilePage(),
    AppointmentPage.routeName: (context) => const AppointmentPage(),
    DoctorDetails.routeName: (context) => const DoctorDetails(),
    ChatPage.routeName: (context) => const ChatPage(),
    DoctorHomePage.routeName: (context) => const DoctorHomePage(),
    BookAppointmentScreen.routeName: (context) => const BookAppointmentScreen(),
    AllSpecialitiesScreen.routeName: (context) => const AllSpecialitiesScreen(),
    //OtpPage.routeName: (context) => const OtpPage(),
  };
}
