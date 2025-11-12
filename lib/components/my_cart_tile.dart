import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/model/cart_item.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12)
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      spacing: 12,
                      children: [
                        //food image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              Image.asset(cartItem.food.imagePath, height: 80),
                        ),
                        //name and price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              cartItem.food.name,
                              style: GoogleFonts.poppins(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            Text(
                              "Rp${cartItem.food.price.toString()}",
                              style: GoogleFonts.poppins(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 12),
                            ),
                          ],
                        ),

                        Spacer(),
                        //add or remove quantity
                        MyQuantitySelector(
                          food: cartItem.food, 
                          onDecrement: () {
                            restaurant.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            restaurant.addToCart(cartItem.food, cartItem.selectedAddon);
                          },
                          quantity: cartItem.quantity
                          )
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
