import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  Widget? child;
  ScaffoldWithNavBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
          height: 60,
          color: Colors.green,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  context.go('/home');
                },
                child: Icon(
                  Icons.home,
                ),
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    context.go('/profile');
                  },
                  child: Icon(Icons.propane_outlined)),
              SizedBox(
                width: 20,
              ),
            ],
          )),
    );
  }
}
