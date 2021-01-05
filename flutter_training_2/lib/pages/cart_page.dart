import 'package:flutter/material.dart';
import 'package:flutter_training_2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static String routeName = "/cart_page";

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart List'),
        actions: [IconButton(icon: Icon(Icons.clear), onPressed: () => provider.clearCart(),
        )],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: provider.cartList.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(provider.cartList[index].name),
                      trailing: Chip(
                        label: Text('${provider.cartList[index].price}'),
                      ),

                    )),
          ),
          Container(
            height: 150,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Text('Grand Total Price: ${provider.totalPrice} Tk', style: TextStyle(fontSize: 25, color: Colors.white),),
          )
        ],
      ),
    );
  }
}
