import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/config/color_system.dart';
import 'package:nailed_it/config/font_system.dart';
import 'package:nailed_it/model/nursery/nursery_brief_state.dart';

class NurseryItem extends StatelessWidget {
  const NurseryItem({
    super.key,
    required this.state,
    required this.onTap,
  });

  final NurseryBriefState state;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        width: Get.width,
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: ColorSystem.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "양식장 ${state.id}",
                    style: FontSystem.KR16B,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "용존 산소 농도 ${state.dissolvedOxygen}",
                    style: FontSystem.KR14M,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ));
  }
}
