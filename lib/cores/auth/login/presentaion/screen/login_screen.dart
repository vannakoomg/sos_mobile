import 'package:flutter/material.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              const Spacer(),
              CustomTextfield(
                hintText: "gmail",
                onChanged: (value) {
                  debugPrint("value $value");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                hintText: "passswork",
                onChanged: (value) {
                  debugPrint("value $value");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtom(
                title: "Login",
                onTap: () {},
              ),
              const Spacer(),
            ],
          )),
    );
  }
}
