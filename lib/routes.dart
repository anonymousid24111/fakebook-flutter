import 'package:fakebook_flutter_app/src/views/ChooseUser/existed_user_login.dart';
import 'package:fakebook_flutter_app/src/views/ChooseUser/logged_user.dart';
import 'package:fakebook_flutter_app/src/views/CreatePost/add_status_page.dart';
import 'package:fakebook_flutter_app/src/views/CreatePost/create_post_page.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/home_page.dart';
import 'package:fakebook_flutter_app/src/views/Login/login_page.dart';
import 'package:fakebook_flutter_app/src/views/Profile/profile_page.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_page.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_step1_name.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_step2_phone.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_step3_password.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_step4_privacy.dart';
import 'package:fakebook_flutter_app/src/views/splash_screen.dart';


const initialRoute = "splash_screen";

var routes = {
  //REGISTER
  'splash_screen': (context) => SplashScreen(),
  'signup_screen': (context) => SignupPage(),
  'signup_step1': (context) => SignupName(),
  //'signup_step2': (context) => SignupBirthday(),
  //'signup_step3': (context) => SignupGenre(),
  'signup_step2': (context) => SignupPhone(),
  'signup_step3': (context) => SignupPassword(),
  'signup_step4': (context) => SignupPrivacy(),

  //LOGIN
  'login_screen': (context) => LoginPage(),
  'choose_user_screen': (context) => LoggedUser(),
  'existeduser_login_screen': (context) => ExistUserLogin(),

  //HOME VIEW
  'home_screen': (context) => HomePage(),
  //CREATE POST
  'create_post': (context) => CreatePostPage(),
  'add_status': (context) => StatusPage(),

  // PROFILE
  'profile_page': (context) => FakeAppProfileStateless(),
  // 'add_status': (context) => StatusPage(),

};