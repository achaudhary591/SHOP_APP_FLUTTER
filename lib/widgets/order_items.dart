import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../providers/orders.dart' as ord;

class OrderItems extends StatefulWidget {
  final ord.OrderItem order;

  OrderItems(this.order);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('₹${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy  hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          // if (_expanded)
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            height: _expanded
                ? widget.order.products.length * 28
                : 5,
            child: ListView(
              children: widget.order.products
                  .map(
                    (prod) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          prod.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${prod.quantity}x ₹${prod.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
