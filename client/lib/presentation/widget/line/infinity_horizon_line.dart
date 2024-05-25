import 'package:flutter/material.dart';

class InfinityHorizonLine extends StatelessWidget {
  const InfinityHorizonLine({
    super.key,
    required this.height,
    this.color,
    this.margin,
  });

  final double height;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      height: height,
      color: color,
    );
  }
}
