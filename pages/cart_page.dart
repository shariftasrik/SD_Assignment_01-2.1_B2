import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sd_assignment01/components/my_button.dart';
import 'package:sd_assignment01/models/product.dart';
import 'package:sd_assignment01/pages/payment.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});


  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product){
    //show a dialogue box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart ??"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child:const Text("Cancel"),
          ),

          //yes button
          MaterialButton(
            onPressed: (){
              //pop dialogue
              Navigator.pop(context);

              //add to cart
              context.read<Shop>().removeFromCart(product);

            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

// user pressed pay button
  void payButtonPressed(BuildContext context) {
    double yourTotalAmount = 50000.0; // Replace with the actual total amount

    // Navigate to PaymentPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage(totalAmount: yourTotalAmount)),
    );
  }
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
              child:cart.isEmpty
                  ?const Center(child: Text("Your cart is empty..!!"))
                  :ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index){
                    //get indiviual item in cart
                    final item = cart[index];

                    //return as a cart tile UI
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );

                  },
              ),
          ),

          //pay button

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child:const Text("PAY NOW"),

            ),
          ),



        ],
      ),
    );
  }
}
