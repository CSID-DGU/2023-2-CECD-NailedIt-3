import 'package:flutter/material.dart';
import 'package:nailed_it/app/config/font_system.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.decoration,
    this.actions = const <Widget>[],
  });

  final String title;
  final Decoration? decoration;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: AppBar(
        title: Text(
          title,
          style: FontSystem.H2,
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: actions,
      ),
    );
  }
}
