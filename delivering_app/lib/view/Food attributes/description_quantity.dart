import 'package:flutter/material.dart';
// import './item_count.dart';
import 'item_quantity.dart';

class Description extends StatelessWidget {
  final String description;
  final String itemName;
  final String caloryCount;
  final String price;
  final String deliveryTime;
  Description(
      {required this.itemName,
      required this.caloryCount,
      required this.description,
      required this.price,
      required this.deliveryTime});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: SingleChildScrollView(
        // physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemName,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 22),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Colors.amber[400],
                              ),
                              Text(
                                caloryCount,
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 170),
                        child: Row(
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                  color: Colors.red[700], fontSize: 18),
                            ),
                            Text(
                              price,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ItemQuantity(deliveryTime),
                  Container(
                    // width: 150,
                    // height: 200,
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.phone, color: Colors.yellow[600]),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: width / 1.3,
                          height: height / 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[600],
                            ),
                            onPressed: () {},
                            child: Text(
                              'add to cart',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
