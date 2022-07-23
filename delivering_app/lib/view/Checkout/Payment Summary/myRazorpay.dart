import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:delivering_app/config/constants.dart';

import '../../../widgets/lottie fles/online_payment_lottie.dart';

class MyRazorpay extends StatefulWidget {
  const MyRazorpay({Key? key}) : super(key: key);

  @override
  _MyRazorpayState createState() => _MyRazorpayState();
}

class _MyRazorpayState extends State<MyRazorpay> {
  TextEditingController textEditingController = TextEditingController();
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_n4d8rsYvKS70tz',
      'amount': num.parse(textEditingController.text) * 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('Externam Wallet');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Razorpay',
        ),
        backgroundColor: primaryColour,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Amount to pay',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: openCheckout,
              child: Text(
                'Pay',
              ),
              style: ElevatedButton.styleFrom(
                primary: primaryColour, // background
                // onPrimary: Colors.yellow, // foreground
              ),
            ),
            OnlinePaymentLottie(),
          ],
        ),
      ),
    );
  }
}
