import 'package:flutter/material.dart';
import 'item_count.dart';

class ItemQuantity extends StatelessWidget {
  final String deliveryTime;
  ItemQuantity(this.deliveryTime);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            width: width - 45,
            margin: EdgeInsets.only(right: 10, top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DeliveryTime(deliveryTime),
                        DeliveryCharge(),
                      ],
                    ),
                    Container(
                      //margin: EdgeInsets.only(right: 10),
                      child: ItemCountWidget(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryCharge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.bike_scooter,
          color: Colors.amber[400],
        ),
        Text('   Free delivery'),
      ],
    );
  }
}

class DeliveryTime extends StatelessWidget {
  final String time;
  DeliveryTime(this.time);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.lock_clock,
          color: Colors.amber[400],
        ),
        Text('  ' + time),
      ],
    );
  }
}
