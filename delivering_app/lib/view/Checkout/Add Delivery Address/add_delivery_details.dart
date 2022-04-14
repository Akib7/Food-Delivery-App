import 'package:delivering_app/controller/Providers/check_out_provider.dart';
import 'package:delivering_app/config/constants.dart';

import 'package:delivering_app/view/Checkout/Google%20Map/google_map.dart';
import 'package:delivering_app/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddDeliveryDetails extends StatefulWidget {
  const AddDeliveryDetails({Key? key}) : super(key: key);

  @override
  State<AddDeliveryDetails> createState() => _AddDeliveryDetailsState();
}

enum AddressTypes {
  Home,
  Work,
  Others,
}

class _AddDeliveryDetailsState extends State<AddDeliveryDetails> {
  var myAddressType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColour,
        title: Text('Add Deliver Details'),
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: checkoutProvider.isLoading == false
            ? MaterialButton(
                child: Text('Add Address'),
                onPressed: () {
                  checkoutProvider.validator(myAddressType);
                },
                color: primaryColour,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CustomTextField(
              labelText: 'First Name',
              controller: checkoutProvider.firstName,
            ),
            CustomTextField(
              labelText: 'Last Name',
              controller: checkoutProvider.lastName,
            ),
            CustomTextField(
              labelText: 'Mobile No.',
              controller: checkoutProvider.mobileNo,
            ),
            CustomTextField(
              labelText: 'Alternate Mobile No.',
              controller: checkoutProvider.alternativeMobileNo,
            ),
            CustomTextField(
              labelText: 'Society',
              controller: checkoutProvider.society,
            ),
            CustomTextField(
              labelText: 'Street',
              controller: checkoutProvider.street,
            ),
            CustomTextField(
              labelText: 'Landmark',
              controller: checkoutProvider.landmark,
            ),
            CustomTextField(
              labelText: 'City',
              controller: checkoutProvider.city,
            ),
            CustomTextField(
              labelText: 'Area',
              controller: checkoutProvider.area,
            ),
            CustomTextField(
              labelText: 'Pin Code',
              controller: checkoutProvider.pinCode,
            ),
            InkWell(
              onTap: () {
                Get.to(() => CustomGoogleMap());
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Set Location"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myAddressType,
              title: Text('Home'),
              secondary: Icon(Icons.home, color: primaryColour),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myAddressType = value!;
                });
              },
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myAddressType,
              title: Text('Work'),
              secondary: Icon(Icons.work, color: primaryColour),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myAddressType = value!;
                });
              },
            ),
            RadioListTile(
              value: AddressTypes.Others,
              groupValue: myAddressType,
              title: Text('Others'),
              secondary: Icon(Icons.devices_other, color: primaryColour),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myAddressType = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
