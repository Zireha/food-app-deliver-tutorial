import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Your location",
                style: GoogleFonts.montserrat(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              content: TextField(
                decoration: InputDecoration(
                    hintText: "Search address...",
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
                  onPressed: () => Navigator.pop(context),
                  child: Text("Save",
                      style: GoogleFonts.montserrat(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold
                          )),
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
                Text(
                  "Jl. Adi Sucipto No 69",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w500),
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
