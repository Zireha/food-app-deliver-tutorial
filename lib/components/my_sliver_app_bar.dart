import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/cart_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      title: Text(
        "Bebek Goreng Hj. Slamet",
        style: GoogleFonts.montserrat(fontSize: 20),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: child,
          ),
          title: title,
          centerTitle: true,
          titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
          expandedTitleScale: 1,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const CartPage())),
            icon: const Icon(Icons.shopping_cart_checkout_rounded))
      ],
    );
  }
}
