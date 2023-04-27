import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/cores/auth/login/presentaion/screen/login_screen.dart';
import 'package:sos_mobile/cores/auth/signup/presetation/screen/signup_screen.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/presentation/screen/slash_screen.dart';
import 'package:sos_mobile/modules/home/presentation/screen/home_screen.dart';
import 'package:sos_mobile/modules/profile/presentation/screen/profile_screen.dart';
import 'package:sos_mobile/modules/question/presentaion/screen/question_detail.dart';

import '../../modules/BottomNavigationBar/presentaion/screen/ScaffoldBar.dart';

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
                  path: 'question-detail/:id',
                  builder: (context, state) {
                    return const QuestionDetail();
                  },
                ),
              ]),
          GoRoute(
            path: '/profile',
            builder: (context, state) {
              return ProfileScreen();
            },
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: ProfileScreen(),
            ),
          ),
        ])
  ],
);
