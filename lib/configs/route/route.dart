import 'package:go_router/go_router.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'slash-screen',
      pageBuilder: (context, state) =>
          NoTransitionPage(key: state.pageKey, child: SlashScreen()),
    ),
  ],
);
