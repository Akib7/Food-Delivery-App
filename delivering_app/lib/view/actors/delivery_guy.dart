import 'package:flutter/material.dart';

import '../../config/constants.dart';

class DeliveryGuy extends StatefulWidget {
  DeliveryGuy({Key? key}) : super(key: key);

  @override
  State<DeliveryGuy> createState() => _DeliveryGuyState();
}

class _DeliveryGuyState extends State<DeliveryGuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColour,
        title: Text('Delivery'),
      ),
    );
  }
}
