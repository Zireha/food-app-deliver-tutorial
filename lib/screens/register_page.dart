import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                "Create an account",
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

              MyTextfield(
                  controller: confirmPasswordController,
                  hintText: "Confirm your password",
                  isObscured: true),

              //sign up button
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: MyButton(
                  buttonText: "Sign Up",
                  onTap: () {},
                ),
              ),

              //have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login now!",
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
