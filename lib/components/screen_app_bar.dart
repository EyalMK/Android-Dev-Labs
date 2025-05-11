import 'package:flutter/material.dart';
import 'texts/screen_title.dart';

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ScreenAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: ScreenTitle(title),
        centerTitle: true
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

