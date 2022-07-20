import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/models/productModel.dart';
import 'package:delivering_app/widgets/search_Item.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final List<ProductModel> search;
  const SearchBar({Key? key, required this.search}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String query = '';
  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColour,
        title: Text(
          'Search',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Items'),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: false,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map((data) {
              return SearchItem(
                isBool: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: 0,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
