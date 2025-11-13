import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:food_delivery_app/screens/payment_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Cart",
              style: GoogleFonts.montserrat(),
            ),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                icon: Icon(Icons.delete_rounded),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Are you sure you want to clear the cart?",
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.w400),
                          ),
                          actions: [
                            //NOoOOoO I don't mean to clear the cart
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.poppins(),
                                )),
                            //YEsssss
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  restaurant.clearCart();
                                },
                                child:
                                    Text("Yes", style: GoogleFonts.poppins())),
                          ],
                        );
                      });
                },
              )
            ],
          ),
          body: Column(
            children: [
              //list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(
                                "Nothing here :(, go pick some foods",
                                style: GoogleFonts.montserrat(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary
                                        .withAlpha(150)),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  //get individual cart item
                                  final cartItem = userCart[index];

                                  //return cart tile UI
                                  return MyCartTile(cartItem: cartItem);
                                }),
                          ),
                  ],
                ),
              ),

              //checkout
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: MyButton(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentPage())),
                    buttonText: "Checkout"),
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
        );
      },
    );
  }
}
