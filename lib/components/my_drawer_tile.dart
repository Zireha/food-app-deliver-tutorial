import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawerTile extends StatelessWidget {
  final String textTile;
  final IconData? iconTile;
  final void Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.textTile,
    required this.iconTile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        title: Text(
          textTile,
          style: GoogleFonts.montserrat(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.w500),
        ),
        leading: Icon(
          iconTile,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onTap: onTap,
      ),
    );
  }
}
