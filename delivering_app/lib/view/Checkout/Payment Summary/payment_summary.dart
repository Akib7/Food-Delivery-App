import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/controller/Providers/reviewCartProvider.dart';
import 'package:delivering_app/models/deliver_address.dart';
import 'package:delivering_app/view/Checkout/Payment%20Summary/myRazorpay.dart';

import 'package:delivering_app/view/Checkout/deliver_details/single_deliver_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'order.dart';
import 'order_placed.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddress deliveryAddressList;

  const PaymentSummary({Key? key, required this.deliveryAddressList})
      : super(key: key);

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myAddressType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    List<String> deliveryList = [];

    double discount = 0;
    double? discountPrice;
    double? totalAfterDiscount;
    double shippingCost = 3.7;
    double totalPrice = reviewCartProvider.getTotalPrice();

    if (totalPrice > 300) {
      discountPrice = ((totalPrice * discount) / 100);

      totalAfterDiscount = totalPrice - discountPrice;
    }
    if (totalAfterDiscount != null) {
      totalAfterDiscount = totalAfterDiscount + shippingCost;
      totalAfterDiscount =
          double.parse((totalAfterDiscount).toStringAsFixed(2));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColour,
        title: Text('Payment Summary'),
      ),
      bottomNavigationBar: ListTile(
        title: Text(
          'Total Amount',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '\$ ${totalAfterDiscount ?? totalPrice}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green[900],
            fontSize: 17,
          ),
        ),
        trailing: MaterialButton(
          child: Text('Place Order'),
          onPressed: () {
            //Will use if else block later to send the date to Delivery guy
            myAddressType == AddressTypes.OnlinePayment
                ? Get.to(
                    () => MyRazorpay(),
                  )
                : deliveryList.add(
                    ("${widget.deliveryAddressList.firstName} ${widget.deliveryAddressList.lastName}")
                        .toUpperCase(),
                  );
            Get.to(
              () => OrderPlaced(),
            );
          },
          color: primaryColour,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryAddress(
                  address:
                      "Area: ${widget.deliveryAddressList.area}, Street: ${widget.deliveryAddressList.street}, Society: ${widget.deliveryAddressList.society}, Pin Code: ${widget.deliveryAddressList.pinCode}",
                  title:
                      ("${widget.deliveryAddressList.firstName} ${widget.deliveryAddressList.lastName}")
                          .toUpperCase(),
                  number: 'Phone: ${widget.deliveryAddressList.mobileNo}',
                  addressType: widget.deliveryAddressList.addressType ==
                          "AddressTypes.Home"
                      ? "Home"
                      : widget.deliveryAddressList.addressType ==
                              "AddressTypes.Other"
                          ? "Other"
                          : "Work",
                ),
                Divider(),
                ExpansionTile(
                  children:
                      reviewCartProvider.getReviewCartDataList.map((data) {
                    return OrderItem(
                      reviewCartItems: data,
                    );
                  }).toList(),
                  title: Text(
                    'Order item ${reviewCartProvider.getReviewCartDataList.length}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    'Sub Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    '\$${totalPrice + 5}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    'Shipping Charge',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    '\$$shippingCost',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    'Company Discount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    '\$${discountPrice ?? discount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Payment Options',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.Home,
                  groupValue: myAddressType,
                  title: Text('Home'),
                  secondary: Icon(Icons.money, color: primaryColour),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myAddressType = value!;
                    });
                  },
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  groupValue: myAddressType,
                  title: Text('Online Payment'),
                  secondary: Icon(Icons.money_off_sharp, color: primaryColour),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myAddressType = value!;
                    });
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
