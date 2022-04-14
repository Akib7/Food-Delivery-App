import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NameRate extends StatelessWidget {
  final String iconName;
  final String restaurantName;
  final String rating;

  NameRate(this.iconName, this.restaurantName, this.rating);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height / 3,
      child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 23, right: 5),
                    child: SvgPicture.asset(
                      "images/$iconName",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 14),
                    child: Text(
                      restaurantName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: SvgPicture.asset(
                      "images/star.svg",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0, left: 5, right: 23),
                    child: Text(
                      rating,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
