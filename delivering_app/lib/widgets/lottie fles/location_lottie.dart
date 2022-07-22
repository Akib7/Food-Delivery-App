import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LocationLottie extends StatefulWidget {
  const LocationLottie({Key? key}) : super(key: key);

  @override
  State<LocationLottie> createState() => _LocationLottieState();
}

class _LocationLottieState extends State<LocationLottie>
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
            'https://assets5.lottiefiles.com/packages/lf20_ecmllzcp.json',
          ),
        ],
      ),
    );
  }
}
