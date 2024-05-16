import 'package:flutter/material.dart';
import 'package:nailed_it/config/font_system.dart';
import 'package:nailed_it/widget/button/custom_icon_button.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.actions = const <CustomIconButton>[],
  });

  final String title;
  final List<CustomIconButton> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: FontSystem.KR20B,
      ),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: actions,
    );
  }
}
