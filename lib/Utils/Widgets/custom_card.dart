import 'package:flutter/material.dart';
import 'package:activos_fijos_app/Utils/Styles/custom_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  const CustomCard({Key? key, required this.child, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        width: double.infinity,
        decoration: _cardShape(),
        padding: const EdgeInsets.all(40),
        child: child,
      ),
    );
  }

  BoxDecoration _cardShape() => BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: CustomColors.negro_80,
              blurRadius: 5,
              offset: const Offset(0, 4),
            )
          ]);
}
