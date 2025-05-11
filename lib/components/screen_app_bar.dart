import 'package:flutter/material.dart';
import 'texts/screen_title.dart';

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final MaterialColor? color;

  const ScreenAppBar(this.title, {this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ScreenTitle(title),
      centerTitle: true,
      backgroundColor: color,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
