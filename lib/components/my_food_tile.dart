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
          child: Row(
            children: [
              // text food details
              Expanded(
                child: Column(
                  children: [
                    Text(
                      food.name,
                      style: GoogleFonts.montserrat(),
                    ),
                    Text(
                      food.price.toString(),
                      style: GoogleFonts.montserrat(),
                    ),
                    Text(
                      food.description,
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),

              Image.asset(food.imagePath, scale: 3)
            ],
          ),
        )
      ],
    );
  }
}
