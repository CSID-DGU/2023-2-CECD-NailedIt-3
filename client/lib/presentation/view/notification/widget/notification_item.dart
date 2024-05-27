import 'package:flutter/material.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/config/font_system.dart';
import 'package:nailed_it/domain/entity/notification/notification_state.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.state,
    this.onTap,
  });

  final NotificationState state;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: state.isRead ? ColorSystem.white : ColorSystem.neutral.shade50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.content,
              style: FontSystem.H5,
            ),
            const SizedBox(height: 8),
            Text(
              state.createdAt,
              style: FontSystem.Sub3,
            ),
          ],
        ),
      ),
    );
  }
}
