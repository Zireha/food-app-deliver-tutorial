import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Your location",
                style: GoogleFonts.montserrat(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              content: TextField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: "Enter address...",
                    hintStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withAlpha(100)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).colorScheme.inversePrimary))),
                style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              actions: [
                //cancel
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel",
                      style: GoogleFonts.montserrat(
                          color: Theme.of(context).colorScheme.inversePrimary)),
                ),

                MaterialButton(
                  onPressed: () {
                    String newAddress = textController.text;
                    context
                        .read<Restaurant>()
                        .updateDeliveryAddress(newAddress);
                    Navigator.pop(context);
                    textController.clear();
                  },
                  child: Text("Save",
                      style: GoogleFonts.montserrat(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            "Deliver Now",
            style: GoogleFonts.poppins(
              color:
                  Theme.of(context).colorScheme.inversePrimary.withAlpha(150),
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                      restaurant.deliveryAddress,
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.w500),
                    ),
                ),
                //dropdown
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
