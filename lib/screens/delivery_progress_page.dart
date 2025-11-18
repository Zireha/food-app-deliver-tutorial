import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_receipt.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:food_delivery_app/services/firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in Progress.."),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      bottomNavigationBar: _buildBottomNavbar(context),
      body: Column(
        children: [
          const MyReceipt(),
        ],
      ),
    );
  }

  //custom bottom navbar
  Widget _buildBottomNavbar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      padding: const EdgeInsets.all(24),
      child: Row(
        spacing: 4,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Asep Sunarno",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text(
                "Driver",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          const Spacer(),
          //message and call button
          Row(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chat,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Colors.greenAccent,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
