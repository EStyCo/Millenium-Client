import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Millennium'),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 214, 213, 213),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
