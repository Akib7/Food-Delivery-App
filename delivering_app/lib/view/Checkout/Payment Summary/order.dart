import 'package:delivering_app/models/reviewCartModel.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  final ReviewCartModel reviewCartItems;
  OrderItem({Key? key, required this.reviewCartItems}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.reviewCartItems.cartName,
            style: TextStyle(color: Colors.grey[900]),
          ),
          Text(
            '${widget.reviewCartItems.cartQuantity}',
            style: TextStyle(color: Colors.grey[900]),
          ),
          Text(
            '\$ ${widget.reviewCartItems.cartPrice}',
            style: TextStyle(color: Colors.grey[900]),
          ),
        ],
      ),
      leading: Image.network(
        widget.reviewCartItems.cartImage,
        width: 60,
      ),
    );
  }
}
