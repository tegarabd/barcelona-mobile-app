import 'package:barcelona/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  PreferredSizeWidget? bottom;
  CustomAppBar({super.key, required this.username, this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottom: bottom,
      title: Wrap(
        spacing: 10,
        children: [
          Image.asset(
            "assets/img/logo.png",
            width: 20,
            height: 20,
          ),
          const Text(
            "FC Barcelona",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              if (App.notifier.value == ThemeMode.light) {
                App.notifier.value = ThemeMode.dark;
              } else {
                App.notifier.value = ThemeMode.light;
              }
            },
            icon: Icon(App.notifier.value == ThemeMode.light
                ? Icons.dark_mode_rounded
                : Icons.light_mode_rounded))
      ],
    );
  }

  @override
  Size get preferredSize => bottom == null
      ? const Size.fromHeight(kToolbarHeight)
      : Size.fromHeight(kToolbarHeight + bottom!.preferredSize.height);
}
