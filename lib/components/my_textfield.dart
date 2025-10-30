import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscured;

  const MyTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isObscured});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        controller: controller,
        obscureText: isObscured,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary)
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.inversePrimary.withAlpha(150)
            )
          )
        ),
    );
  }
}
