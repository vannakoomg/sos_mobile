import 'package:flutter/material.dart';
import 'package:sos_mobile/cores/walk_though/singin/controller/auth_service.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final con = AuthService();
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Google"),
              onPressed: () {
                con.signInWithGoogle();
              },
            ),
            ElevatedButton(
              child: const Text("Sing out"),
              onPressed: () {
                con.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
