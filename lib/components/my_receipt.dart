import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            Text(
              "Thanks for your order!",
              style: GoogleFonts.montserrat(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.inversePrimary),
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(24),
              child: Text("Receipt here..",
                  style: GoogleFonts.montserrat(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
