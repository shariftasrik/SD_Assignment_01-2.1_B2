import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final double totalAmount; // assuming you're passing this value

  const PaymentPage({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            paymentMethod('assets/bkash.png', 'bKash'),
            paymentMethod('assets/Nagad.png', 'Nagad'),
            paymentMethod('assets/visa.png', 'Visa Card'),
            paymentMethod('assets/mastercard.png', 'Master Card'),
          ],
        ),
      ),
    );
  }

  Widget paymentMethod(String imagePath, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(name),
        onTap: () {
          // Implement the functionality when a payment method is tapped
        },
      ),
    );
  }
}