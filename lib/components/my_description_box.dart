import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryTextStyle =
        GoogleFonts.montserrat(color: Theme.of(context).colorScheme.inversePrimary);

    var secondaryTextStyle =
        GoogleFonts.montserrat(color: Theme.of(context).colorScheme.primary);

    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(12),
          ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Text(
                "Rp10.000",
                style: primaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Delivery fee",
                style: secondaryTextStyle,
              )
            ],
          ),
          //deliv time
          Column(
            children: [
              Text(
                "5-10 mins",
                style: primaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Delivery time (approx.)",
                style: secondaryTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
