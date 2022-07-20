import 'package:delivering_app/config/constants.dart';
import 'package:flutter/material.dart';

class ItemCountWidget extends StatefulWidget {
  @override
  _ItemCountWidgetState createState() => _ItemCountWidgetState();
}

class _ItemCountWidgetState extends State<ItemCountWidget> {
  int _counter = 0;
  void addItem() {
    if (_counter == 10) return;
    setState(() {
      _counter++;
    });
  }

  void removeItem() {
    if (_counter == 0) return;
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      color: primaryColour,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(1, 0),
              primary: primaryColour,
            ),
            onPressed: () {
              removeItem();
            },
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          Text(
            '$_counter',
            style: TextStyle(color: Colors.white),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(1, 0),
              primary: primaryColour,
            ),
            onPressed: () {
              addItem();
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
