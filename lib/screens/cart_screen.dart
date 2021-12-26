import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/widgets/cart_item.dart';
import 'package:shopping_app/providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        "\$${cart.totalAmount}",
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline5!
                              .color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) {
                return CartItem(
                  id: cart.items.values.toList()[i].id,
                  productId: cart.items.keys.toList()[i],
                  title: cart.items.values.toList()[i].title,
                  quantity: cart.items.values.toList()[i].quantity,
                  price: cart.items.values.toList()[i].price,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
