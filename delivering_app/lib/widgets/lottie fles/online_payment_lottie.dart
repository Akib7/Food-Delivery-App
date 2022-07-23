import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnlinePaymentLottie extends StatefulWidget {
  const OnlinePaymentLottie({Key? key}) : super(key: key);

  @override
  State<OnlinePaymentLottie> createState() => _OnlinePaymentLottieState();
}

class _OnlinePaymentLottieState extends State<OnlinePaymentLottie>
    with SingleTickerProviderStateMixin {
  // animation controller
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.network(
            'https://assets4.lottiefiles.com/private_files/lf30_rdtlewvq.json',
          ),
        ],
      ),
    );
  }
}
