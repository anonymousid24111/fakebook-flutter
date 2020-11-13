import 'package:fakebook_flutter_app/src/views/HomePage/home_page.dart';
import 'package:fakebook_flutter_app/src/views/Login/login_page.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_page.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_step1_name.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_step2_birthday.dart';
import 'package:fakebook_flutter_app/src/views/splash_screen.dart';

const initialRoute = "splash_screen";

var routes = {
  //REGISTER
  'splash_screen': (context) => SplashScreen(),
  'signup_screen': (context) => SignupPage(),
  'signup_step1': (context) => SignupName(),
  'signup_step2': (context) => SignupBirthday(),
  'login_screen': (context) => LoginPage(),

  //HOME VIEW
  'home_screen': (context) => HomePage(),

  // PROFILE

};