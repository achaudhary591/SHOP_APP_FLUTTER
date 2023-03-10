import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {

  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItems({required this.id, required this.price, required this.quantity, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          title: Text(title),
          subtitle: Text('Total: ₹${(price * quantity)}'),
          trailing: Text('$quantity x'),
          leading: CircleAvatar(
            child: FittedBox(
              child: Text(
                '₹$price',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
