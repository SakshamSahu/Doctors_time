import 'package:doctors_time/Pages/get_started_page.dart';
import 'package:doctors_time/pages/sign_in_page.dart';
import 'package:doctors_time/pages/sign_up_page.dart';

class AppRoutes {
  static final routes = {
    GetStartedPage.routeName: (context) => const GetStartedPage(),
    SigninPage.routeName: (context) => const SigninPage(),
    SignupPage.routeName: (context) => const SignupPage(),
  };
}
