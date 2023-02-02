import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                  // pageBuilder: (context, state) => CustomTransitionPage<void>(
                  //   key: state.pageKey,
                  //   opaque: false,
                  //   maintainState: false,
                  //   child: const QuestionDetail(),
                  //   transitionsBuilder:
                  //       (context, animation, secondaryAnimation, child) =>
                  //           FadeTransition(opacity: animation, child: child),
                  // ),
                ),
              ]),
          GoRoute(
            path: '/profile',
            builder: (context, state) {
              return const ProfileScreen();
            },
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),
        ])
  ],
);
