import 'package:go_router/go_router.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/presentation/screen/slash_screen.dart';

import '../../modules/home/logic/screen/home_screen.dart';

final router = GoRouter(
  // initialLocation: '/slash-screen',
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
      builder: (_, state) => const HomeScreen(),
    ),
  ],
);
