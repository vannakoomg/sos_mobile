import 'package:go_router/go_router.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/create_account_screen.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/otp_screen.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/select_subject_scree.dart';
import 'package:sos_mobile/cores/auth/hello/screens/hello_screen.dart';
import 'package:sos_mobile/cores/walk_though/singin/screens/singin_screen.dart';
import 'package:sos_mobile/modules/question/screen/question_detail.dart';
import 'package:sos_mobile/modules/settings/modules/privacy_data/screen/setting_privacy_data_screen.dart';
import 'package:sos_mobile/modules/settings/screens/setting_screen.dart';

import '../../cores/auth/login/screen/login_screen.dart';
import '../../cores/auth/signup/screen/signup_screen.dart';
import '../../cores/walk_though/slash_screen/screen/slash_screen.dart';
import '../../modules/BottomNavigationBar/screen/BottonNavigettion.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// GlobalKey<NavigatorState> _shellNaigationkey =
//     GlobalKey<NavigatorState>(debugLabel: 'shell');
final router = GoRouter(
  // navigatorKey: _rootNavigatorKey,
  initialLocation: '/slash-screen',
  routes: [
    GoRoute(
      path: '/slash-screen',
      builder: (context, state) {
        return const SlashScreen();
      },
    ),
    GoRoute(
        path: '/hello',
        builder: (context, state) {
          return const HelloScreen();
        },
        routes: [
          GoRoute(
            path: 'login-screen',
            builder: (context, state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
              path: 'create-account',
              builder: (context, state) {
                return const CreateAccountScreen();
              },
              routes: [
                GoRoute(
                    path: 'otp',
                    builder: (context, state) {
                      return OtpScreen();
                    },
                    routes: [
                      GoRoute(
                        path: 'select-subject',
                        builder: (context, state) {
                          return const SeletctSubjectScreen();
                        },
                      ),
                    ]),
              ]),
        ]),
    GoRoute(
      path: '/singin',
      builder: (context, state) {
        return const SingInScreen();
      },
    ),
    GoRoute(
      path: '/signup-screen',
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
        path: '/home-screen',
        builder: (context, state) {
          return const ScaffoldWithNavBar();
        },
        routes: [
          GoRoute(
            path: 'question-detail',
            builder: (context, state) {
              return const QuestionDetail();
            },
          ),
          GoRoute(
              path: 'setting',
              builder: (context, state) {
                return const SettingScreen();
              },
              routes: [
                GoRoute(
                  path: 'privacy-data',
                  builder: (context, state) {
                    return const PrivacyDataScreen();
                  },
                ),
              ]),
        ]),
  ],
);
