import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/presentation/screen/slash_screen.dart';
import 'package:sos_mobile/homeScreen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'slash-screen',
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const SlashScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
