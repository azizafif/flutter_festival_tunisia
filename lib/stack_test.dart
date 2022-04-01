import 'package:flutter/material.dart';
import 'dart:math' as math;

class StackTest extends StatefulWidget {
  const StackTest({Key? key}) : super(key: key);

  @override
  State<StackTest> createState() => _StackTestState();
}

class _StackTestState extends State<StackTest>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: _animationController,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Center(
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(200.0)
                  ..rotateZ(math.pi / 2),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/monastir.jpeg',
                      fit: BoxFit.cover,
                      // height: double.infinity,
                      width: double.infinity,
                    ),
                    const Positioned(
                        bottom: 15,
                        left: 9,
                        child: Text(
                          'Welcome to Monastir',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      builder: (context, child) => Transform.rotate(
          angle: _animationController.value * math.pi * 2, child: child),
    ));
  }
}
