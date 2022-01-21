import 'package:flutter/material.dart';

class ColorBackground extends StatelessWidget {
  final Widget child;
  final Color color;
  const ColorBackground({Key? key, required this.child, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          SafeArea(
            child: Center(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
