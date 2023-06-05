import 'package:sos_mobile/cores/auth/login/presentaion/screen/login_screen.dart';
import 'package:sos_mobile/cores/auth/signup/presetation/screen/signup_screen.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/presentation/screen/slash_screen.dart';
import 'package:sos_mobile/modules/profile/presentation/screen/profile_screen.dart';
import 'package:sos_mobile/modules/question/screen/question_detail.dart';

var router = {
  'login-screen': (context) => const LoginScreen(),
  'slash-screen': (context) => const SlashScreen(),
  'signup-screen': (context) => const SignUpScreen(),
  'question-detail': (context) => const QuestionDetail(),
  'profile': (context) => ProfileScreen(),
};
