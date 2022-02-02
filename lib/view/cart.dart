import 'package:flutter/material.dart';
class Cart extends StatelessWidget {
  const Cart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                // cart.items.length,
                itemBuilder: (ctx, i) =>Container(
                  color: Colors.black,
                  child: Center(child: Text('Container'),),
                ) ,
                // itemBuilder: (ctx, i) => CartItemTile(
                //   id: cart.items.values.toList()[i].id,
                //   productId: cart.items.keys.toList()[i],
                //   price: cart.items.values.toList()[i].price,
                //   quantity: cart.items.values.toList()[i].quantity,
                //   name: cart.items.values.toList()[i].name,
                // ),
              ),
            ),
          ],
        );
  }
}