import 'package:flutter/material.dart';

class InfinityHorizonLine extends StatelessWidget {
  const InfinityHorizonLine({
    super.key,
    required this.height,
    this.color,
  });

  final Color? color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: color,
    );
  }
}
