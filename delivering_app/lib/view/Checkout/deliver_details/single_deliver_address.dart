import 'package:delivering_app/config/constants.dart';
import 'package:flutter/material.dart';

class SingleDeliveryAddress extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;

  SingleDeliveryAddress(
      {required this.title,
      required this.address,
      required this.number,
      required this.addressType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 60,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: primaryColour,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    addressType,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: primaryColour,
          ),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(address),
            SizedBox(
              height: 5,
            ),
            Text(number),
            Divider(
              height: 35,
            ),
          ]),
        ),
      ],
    );
  }
}
