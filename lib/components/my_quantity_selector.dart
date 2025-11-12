import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/food.dart';
import 'package:google_fonts/google_fonts.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const MyQuantitySelector(
      {super.key,
      required this.food,
      required this.onIncrement,
      required this.onDecrement,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //decrease
          GestureDetector(
            onTap: onDecrement,
            child: Icon(Icons.remove,
                size: 20, color: Theme.of(context).colorScheme.inversePrimary),
          ),
          //quantity counter
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(width: 20, child: Center(child: Text(quantity.toString(), style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),))),
          ),
          GestureDetector(
            onTap: onIncrement  ,
            child: Icon(Icons.add,
                size: 20, color: Theme.of(context).colorScheme.inversePrimary),
          ),
          //increase
        ],
      ),
    );
  }
}
