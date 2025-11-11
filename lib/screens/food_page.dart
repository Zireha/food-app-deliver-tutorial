import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/model/food.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOn, bool> selectedAddOn = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    //initialize selected addons to be false (unchecked)

    for (AddOn addOn in food.availableAddOns) {
      selectedAddOn[addOn] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //add to cart

  void addToCart(Food food, Map<AddOn, bool> selectedAddons) {
    //close current page and go back to menu
    Navigator.pop(context);

    List<AddOn> currentlySelectedAddons = [];
    for (AddOn addon in widget.food.availableAddOns) {
      if (widget.selectedAddOn[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 4,
              children: [
                Image.asset(
                  widget.food.imagePath,
                  scale: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      Text(
                        widget.food.description,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .inversePrimary
                              .withAlpha(180),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withAlpha(100),
                      ),
                      Text(
                        "Add-Ons",
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      //addons
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary
                                  .withAlpha(150),
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddOns.length,
                          itemBuilder: (context, i) {
                            AddOn addon = widget.food.availableAddOns[i];
                            return CheckboxListTile(
                              title: Text(
                                addon.name,
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "Rp${addon.price.toString()}",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary
                                        .withAlpha(150)),
                              ),
                              overlayColor: WidgetStateProperty.all(
                                  Theme.of(context).colorScheme.inversePrimary),
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                              value: widget.selectedAddOn[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddOn[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: MyButton(
                      onTap: () => addToCart(widget.food, widget.selectedAddOn),
                      buttonText: "Add to Cart"),
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),

        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.8,
            child: Container(
              margin: EdgeInsets.only(top: 24, left: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                color: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}
