import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/food.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    color: Theme.of(context).colorScheme.inversePrimary.withAlpha(180),
                  ),
                ),
                SizedBox(height: 8,),
                Divider(
                  indent: 8,
                  endIndent: 8,
                  thickness: 4,
                  color: Theme.of(context).colorScheme.inversePrimary.withAlpha(100),
                ),
                Text(
                  "Add-Ons",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                  ),
                ),
                //addons
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.inversePrimary.withAlpha(150),
                    ),
                    borderRadius: BorderRadius.circular(12)
                  ),
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
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.w500 
                              ),
                        ),
                        subtitle: Text(
                          addon.price.toString(),
                          style: GoogleFonts.poppins(
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary
                                  .withAlpha(150)),
                        ),
                        overlayColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.inversePrimary),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.inversePrimary),
                        value: false,
                        onChanged: (value) {
                          value = value!;
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
