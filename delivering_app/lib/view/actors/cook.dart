import 'package:flutter/material.dart';

import '../../config/constants.dart';

class Cook extends StatelessWidget {
  const Cook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColour,
        title: Text('Cook'),
      ),
    );
  }
}
