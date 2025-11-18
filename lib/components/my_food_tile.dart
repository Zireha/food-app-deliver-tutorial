import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/food.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const MyFoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              spacing: 16,
              children: [
                // text food details
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: GoogleFonts.montserrat(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Rp${food.price.toString()}",
                        style: GoogleFonts.montserrat(
                          color: Theme.of(context).colorScheme.inversePrimary.withAlpha(200)
                        ),
                      ),
                      Text(
                        food.description,
                        style: GoogleFonts.poppins(fontSize: 12, color: Theme.of(context).colorScheme.inversePrimary.withAlpha(200)),
                      ),
                    ],
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    food.imagePath,
                    height: 120,
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          indent: 12,
          endIndent: 12,
          color: Theme.of(context).colorScheme.inversePrimary.withAlpha(100),
        )
      ],
    );
  }
}
