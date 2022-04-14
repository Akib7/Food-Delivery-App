import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: camel_case_types
class getTabBar extends StatelessWidget {
  const getTabBar({Key? key}) : super(key: key);

  getTabs(String text, AssetImage imageType) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 100,
        width: 60,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      height: 40,
                      width: 30,
                      fit: BoxFit.cover,
                      image: imageType,
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 8,
              blurRadius: 15,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  getTabs2(String text, String image) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 100,
        width: 60,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: SvgPicture.asset(
                    image,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 8,
              blurRadius: 15,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          height: 150,
          width: 550,
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTabs(
                  "All",
                  AssetImage('images/fastfood_illustrator.jpg'),
                ),
                getTabs2("Burger", "images/bg1.svg"),
                getTabs2("Pizza", "images/bg2.svg"),
                getTabs(
                  "Hotdog",
                  AssetImage('images/hotdog.jpg'),
                ),
                getTabs2("Dessert", "images/bg3.svg"),
                getTabs(
                  "Chicken",
                  AssetImage('images/chicken_illustrator.jpg'),
                ),
                getTabs(
                  "Pasta",
                  AssetImage('images/pasta.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
