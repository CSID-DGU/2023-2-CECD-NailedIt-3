import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nailed_it/config/color_system.dart';
import 'package:nailed_it/config/font_system.dart';
import 'package:nailed_it/widget/button/custom_icon_button.dart';

class DefaultBackAppBar extends StatelessWidget {
  const DefaultBackAppBar({
    super.key,
    required this.title,
    this.actions = const <CustomIconButton>[],
    this.onBackPress,
  });

  final String title;
  final List<CustomIconButton> actions;
  final Function()? onBackPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          title,
          style: FontSystem.KR24B,
        ),
      ),
      centerTitle: false,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      titleSpacing: 0,
      leadingWidth: 50,
      leading: IconButton(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/arrow_back.svg",
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(ColorSystem.black, BlendMode.srcIn),
        ),
        onPressed: onBackPress,
      ),
      actions: actions,
    );
  }
}
