import 'package:sos_mobile/cores/auth/login/screen/login_screen.dart';
import 'package:sos_mobile/cores/auth/signup/screen/signup_screen.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/screen/slash_screen.dart';
import 'package:sos_mobile/modules/profile/screen/profile_screen.dart';
import 'package:sos_mobile/modules/question/screen/question_detail.dart';

var router = {
  'login-screen': (context) => const LoginScreen(),
  'slash-screen': (context) => const SlashScreen(),
  'signup-screen': (context) => const SignUpScreen(),
  'question-detail': (context) => const QuestionDetail(),
  'profile': (context) => ProfileScreen(),
};
