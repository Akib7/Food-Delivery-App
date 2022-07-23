import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  MyGooglePay({Key? key}) : super(key: key);

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  void onGooglePayResult(paymentResult) {
    print(paymentResult);
  }

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfigurationAsset: 'sample_payment_configuration.json',
      paymentItems: _paymentItems,
      style: GooglePayButtonStyle.black,
      type: GooglePayButtonType.pay,
      onPaymentResult: onGooglePayResult,
    );
  }
}
