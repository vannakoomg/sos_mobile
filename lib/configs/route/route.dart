import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/notification/screens/notificaition_screen.dart';
import 'package:sos_mobile/modules/post_question/screen/post_question_screen.dart';
import 'package:sos_mobile/modules/save/screens/save_screen.dart';
import 'package:sos_mobile/modules/settings/screens/setting_screen.dart';

import '../../cores/auth/login/screen/login_screen.dart';
import '../../cores/auth/signup/screen/signup_screen.dart';
import '../../cores/walk_though/slash_screen/screen/slash_screen.dart';
import '../../modules/BottomNavigationBar/screen/BottonNavigettion.dart';
import '../../modules/home/screen/home_screen.dart';
import '../../modules/profile/screen/profile_screen.dart';
import '../../modules/question/screen/question_detail.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _shellNaigationkey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/slash-screen',
  routes: [
    GoRoute(
      path: '/slash-screen',
      builder: (context, state) {
        return const SlashScreen();
      },
    ),
    GoRoute(
      path: '/login-screen',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signup-screen',
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
    ShellRoute(
        navigatorKey: _shellNaigationkey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
              path: '/home',
              builder: (context, state) {
                return const HomeScreen();
              },
              pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: const HomeScreen(),
                  ),
              routes: [
                GoRoute(
                  path: 'question-detail',
                  builder: (context, state) {
                    return const QuestionDetail();
                  },
                ),
              ]),
          GoRoute(
            path: '/save',
            builder: (context, state) {
              return const SaveScreen();
            },
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const SaveScreen(),
            ),
          ),
          GoRoute(
            path: '/post-question',
            builder: (context, state) {
              return const PostQuestionScreen();
            },
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const PostQuestionScreen(),
            ),
          ),
          GoRoute(
            path: '/notification',
            builder: (context, state) {
              return const NotificationScreen();
            },
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const NotificationScreen(),
            ),
          ),
          GoRoute(
              path: '/profile',
              builder: (context, state) {
                return const ProfileScreen();
              },
              pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: const ProfileScreen(),
                  ),
              routes: [
                GoRoute(
                  path: 'setting',
                  builder: (context, state) {
                    return const SettingScreen();
                  },
                ),
              ]),
        ])
  ],
);
