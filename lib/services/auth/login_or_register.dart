import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/login_page.dart';
import 'package:food_delivery_app/screens/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isLoggingIn = true;

  void togglePages() {
    setState(() {
      isLoggingIn = !isLoggingIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggingIn
        ? LoginPage(onTap: togglePages)
        : RegisterPage(onTap: togglePages);
  }
}
