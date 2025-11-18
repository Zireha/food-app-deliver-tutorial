import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_delivery_app/model/cart_item.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
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
                    child: Image.asset(cartItem.food.imagePath, height: 80),
                  ),
                  //name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(
                          cartItem.food.name,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        Text(
                          "Rp${cartItem.food.price.toString()}",
                          style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),

                  //add or remove quantity
                  MyQuantitySelector(
                      food: cartItem.food,
                      onDecrement: () {
                        restaurant.removeFromCart(cartItem);
                      },
                      onIncrement: () {
                        restaurant.addToCart(
                            cartItem.food, cartItem.selectedAddon);
                      },
                      quantity: cartItem.quantity)
                ],
              ),
            ),
            SizedBox(
              height: cartItem.selectedAddon.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 8, bottom: 8, right: 8),
                children: cartItem.selectedAddon
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              //addon name
                              Text(addon.name),
                              //addon price
                              SizedBox(
                                height: 12,
                              ),
                              Text(" (Rp${addon.price.toString()})")
                            ],
                          ),
                          onSelected: (value) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary,
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary
                                      .withAlpha(150))),
                          labelStyle: GoogleFonts.poppins(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
