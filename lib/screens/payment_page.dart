import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/screens/delivery_progress_page.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  //cha ching time
  void userPay() {
    if (formKey.currentState!.validate()) {
      //show dialog if form is valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            //cancel da cha ching?
            TextButton(
              child: Text("No"),
              onPressed: () => Navigator.pop(context),
            ),
            //go brrr
            TextButton(
              child: Text("Yes"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryProgressPage(),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Checkout",
          style: GoogleFonts.montserrat(
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            inputConfiguration: InputConfiguration(
              expiryDateTextStyle: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.inversePrimary),
              cardHolderTextStyle: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.inversePrimary),
              cardNumberTextStyle: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.inversePrimary),
              cvvCodeTextStyle: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: MyButton(
              buttonText: "Pay Now",
              onTap: () => userPay(),
            ),
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
