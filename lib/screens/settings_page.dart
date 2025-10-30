import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Settings",
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              
            ),
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",style: GoogleFonts.montserrat(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                    ),
                ),
                Switch(
                    activeColor: Theme.of(context).colorScheme.inversePrimary,
                    value: false,
                    onChanged: (value) {
                      
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
