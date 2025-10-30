import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              //logo
              Icon(
                Icons.food_bank_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              //slogan
              Text(
                "Food Delivery App",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              //email, pass textfield
              MyTextfield(
                controller: emailController,
                hintText: "E-Mail",
                isObscured: false,
              ),
              MyTextfield(
                controller: passwordController,
                hintText: "Password",
                isObscured: true,
              ),
              //sign in button
              MyButton(
                buttonText: "Sign In",
                onTap: () {},
              ),
              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    "Not a member?",
                    style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register now!",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        // decoration: TextDecoration.underline,
                        // decorationColor: Colors.white
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
