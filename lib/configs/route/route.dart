import 'package:go_router/go_router.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/create_account_screen.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/otp_screen.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/select_subject_scree.dart';
import 'package:sos_mobile/cores/auth/hello/screens/hello_screen.dart';
import 'package:sos_mobile/cores/walk_though/singin/screens/singin_screen.dart';
import 'package:sos_mobile/modules/question/screen/question_detail.dart';
import 'package:sos_mobile/modules/settings/modules/feedback/screen/feedback_screen.dart';
import 'package:sos_mobile/modules/settings/modules/notification/screens/setting_notification_screen.dart';
import 'package:sos_mobile/modules/settings/modules/privacy_data/screen/setting_privacy_data_screen.dart';
import 'package:sos_mobile/modules/settings/modules/profile_information/screen/profile_info_screen.dart';
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
                      return const OtpScreen();
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
                  path: 'profile-info',
                  builder: (context, state) {
                    return const ProfileInfoScreen();
                  },
                ),
                GoRoute(
                  path: 'setting-privacy',
                  builder: (context, state) {
                    return const SettingPricacyData();
                  },
                ),
                GoRoute(
                  path: 'setting-notification',
                  builder: (context, state) {
                    return const SettingNotificationScreen();
                  },
                ),
                GoRoute(
                  path: 'feedback',
                  builder: (context, state) {
                    return const FeedBackScreen();
                  },
                ),
              ]),
        ]),
  ],
);
