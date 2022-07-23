import 'package:delivering_app/controller/Providers/check_out_provider.dart';
import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/models/deliver_address.dart';

import 'package:delivering_app/view/Checkout/Add%20Delivery%20Address/add_delivery_details.dart';
import 'package:delivering_app/view/Checkout/Payment%20Summary/payment_summary.dart';
import 'package:delivering_app/view/Checkout/deliver_details/single_deliver_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../widgets/lottie fles/location_lottie.dart';

class DeliverDetails extends StatefulWidget {
  DeliverDetails({Key? key}) : super(key: key);

  @override
  State<DeliverDetails> createState() => _DeliverDetailsState();
}

class _DeliverDetailsState extends State<DeliverDetails> {
  late DeliveryAddress value;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAdressProvider = Provider.of(context);
    deliveryAdressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColour,
        title: Text('Delivery Details'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColour,
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(
            () => AddDeliveryDetails(),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: MaterialButton(
          child: deliveryAdressProvider.getDeliveryAddressDataList.isEmpty
              ? Text('Add New Address')
              : Text('Payment Summary'),
          onPressed: () {
            deliveryAdressProvider.getDeliveryAddressDataList.isEmpty
                ? Get.to(
                    () => AddDeliveryDetails(),
                  )
                : Get.to(
                    () => PaymentSummary(
                      deliveryAddressList: value,
                    ),
                  );
          },
          color: primaryColour,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Deliver To'),
            leading: Image.asset(
              'images/address.png',
              height: 30,
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black45,
          ),
          Column(
            children: [
              Column(
                children: deliveryAdressProvider.getDeliveryAddressDataList
                    .map<Widget>((data) {
                  setState(() {
                    value = data;
                  });
                  return SingleDeliveryAddress(
                    address:
                        "Area: ${data.area}, Street: ${data.street}, Society: ${data.society}, Pin Code: ${data.pinCode}",
                    title: ("${data.firstName} ${data.lastName}").toUpperCase(),
                    number: 'Phone: ${data.mobileNo}',
                    addressType: data.addressType == "AddressTypes.Home"
                        ? "Home"
                        : data.addressType == "AddressTypes.Other"
                            ? "Other"
                            : "Work",
                  );
                }).toList(),
              ),
              LocationLottie(),
            ],
          ),
        ],
      ),
    );
  }
}
