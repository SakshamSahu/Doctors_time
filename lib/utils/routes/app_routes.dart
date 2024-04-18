import 'package:doctors_time/Pages/get_started_page.dart';
import 'package:doctors_time/pages/appointment_page.dart';
import 'package:doctors_time/pages/chat_page.dart';
import 'package:doctors_time/pages/doctor_details.dart';
import 'package:doctors_time/pages/doctor_home_page.dart';
import 'package:doctors_time/pages/home_page.dart';
import 'package:doctors_time/pages/profile_page.dart';
import 'package:doctors_time/pages/search_specialist.dart';
import 'package:doctors_time/pages/sign_in_page.dart';
import 'package:doctors_time/pages/sign_up_as.dart';
import 'package:doctors_time/pages/sign_up_page_patient.dart';
import 'package:doctors_time/pages/sign_up_page_doctor.dart';
import 'package:doctors_time/widgets/bottom_navigation_bar.dart';

class AppRoutes {
  static final routes = {
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
    //OtpPage.routeName: (context) => const OtpPage(),
  };
}
