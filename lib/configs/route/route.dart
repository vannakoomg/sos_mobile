import 'package:go_router/go_router.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/create_account_screen.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/otp_screen.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/select_subject_scree.dart';
import 'package:sos_mobile/cores/auth/hello/screens/hello_screen.dart';
import 'package:sos_mobile/cores/walk_though/singin/screens/singin_screen.dart';
import 'package:sos_mobile/modules/question/screen/question_detail.dart';
import 'package:sos_mobile/modules/save/screens/create_savecatefory_screen.dart';
import 'package:sos_mobile/modules/save/screens/save_detail_screen.dart';
import 'package:sos_mobile/modules/settings/modules/feedback/screen/feedback_screen.dart';
import 'package:sos_mobile/modules/settings/modules/notification/screens/setting_notification_screen.dart';
import 'package:sos_mobile/modules/settings/modules/privacy_data/screen/setting_privacy_data_screen.dart';
import 'package:sos_mobile/modules/settings/modules/profile_information/screen/profile_info_screen.dart';
import 'package:sos_mobile/modules/settings/modules/securty_login/screens/black_screen.dart';
import 'package:sos_mobile/modules/settings/modules/securty_login/screens/hide_screen.dart';
import 'package:sos_mobile/modules/settings/modules/theme/screen/theme_screen.dart';
import 'package:sos_mobile/modules/settings/screens/setting_screen.dart';
import 'package:sos_mobile/modules/user_profile/screens/user_profile_screen.dart';

import '../../cores/auth/login/screen/login_screen.dart';
import '../../cores/auth/signup/screen/signup_screen.dart';
import '../../cores/walk_though/slash_screen/screen/slash_screen.dart';
import '../../modules/BottomNavigationBar/screen/BottonNavigettion.dart';
import '../../modules/settings/modules/securty_login/screens/security_login.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// GlobalKey<NavigatorState> _shellNaigationkey =
//     GlobalKey<NavigatorState>(debugLabel: 'shell');
final router = GoRouter(
  // navigatorKey: _rootNavigatorKey,
  initialLocation: '/slash-screen',
  routes: [
    GoRoute(
      path: '/slash-screen',
      name: '/slash-screen',
      builder: (context, state) {
        return const SlashScreen();
      },
    ),
    GoRoute(
        name: 'hello',
        path: '/hello',
        builder: (context, state) {
          return const HelloScreen();
        },
        routes: [
          GoRoute(
            name: 'login-screen',
            path: 'login-screen',
            builder: (context, state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
              path: 'create-account',
              name: 'create-account',
              builder: (context, state) {
                return const CreateAccountScreen();
              },
              routes: [
                GoRoute(
                    path: 'otp',
                    name: 'otp',
                    builder: (context, state) {
                      return const OtpScreen();
                    },
                    routes: [
                      GoRoute(
                        path: 'select-subject',
                        name: 'select-subject',
                        builder: (context, state) {
                          return const SeletctSubjectScreen();
                        },
                      ),
                    ]),
              ]),
        ]),
    GoRoute(
      name: '/singin',
      path: '/singin',
      builder: (context, state) {
        return const SingInScreen();
      },
    ),
    GoRoute(
      name: '/signup-screen',
      path: '/signup-screen',
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
        path: '/home',
        name: '/home',
        builder: (context, state) {
          return const ScaffoldWithNavBar();
        },
        routes: [
          GoRoute(
            name: 'create-save',
            path: 'create-save',
            builder: (context, state) {
              return const CreateSaveScreen();
            },
          ),
          GoRoute(
            name: 'save-detail',
            path: 'save-detail/:title/:id',
            builder: (context, state) {
              return SaveDetailScreen(
                title: state.pathParameters['title'],
                id: state.pathParameters['id'],
              );
            },
          ),
          GoRoute(
            name: 'question-detail',
            path: 'question-detail/:id',
            builder: (context, state) {
              return QuestionDetail(
                id: state.pathParameters['id']!,
              );
            },
          ),
          GoRoute(
              name: 'setting',
              path: 'setting',
              builder: (context, state) {
                return const SettingScreen();
              },
              routes: [
                GoRoute(
                  path: 'profile-info',
                  name: 'profile-info',
                  builder: (context, state) {
                    return const ProfileInfoScreen();
                  },
                ),
                GoRoute(
                  path: 'theme',
                  name: 'theme',
                  builder: ((context, state) {
                    return const ThemeScreen();
                  }),
                ),
                GoRoute(
                  path: 'setting-privacy',
                  name: 'setting-privacy',
                  builder: (context, state) {
                    return const SettingPricacyData();
                  },
                ),
                GoRoute(
                  path: 'setting-notification',
                  name: 'setting-notification',
                  builder: (context, state) {
                    return const SettingNotificationScreen();
                  },
                ),
                GoRoute(
                  path: 'feedback',
                  name: 'feedback',
                  builder: (context, state) {
                    return const FeedBackScreen();
                  },
                ),
                GoRoute(
                    path: 'security-login',
                    name: 'security-login',
                    builder: (context, state) {
                      return const SecurityLoginScreen();
                    },
                    routes: [
                      GoRoute(
                        path: 'hide',
                        name: 'hide',
                        builder: (context, state) {
                          return const HideScreen();
                        },
                      ),
                      GoRoute(
                        path: 'block',
                        name: 'block',
                        builder: (context, state) {
                          return const BlockScreen();
                        },
                      ),
                    ]),
              ]),
        ]),
    GoRoute(
      name: '/user-profile',
      path: '/user-profile/:id',
      builder: (context, state) {
        return UserProfileScreen(
          id: state.pathParameters['id']!,
        );
      },
    ),
  ],
);
