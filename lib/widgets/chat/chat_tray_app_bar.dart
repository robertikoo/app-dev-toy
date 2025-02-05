import 'package:flutter/material.dart';

class ChatTrayAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatTrayAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Bandeja de Chat'),
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Implementar búsqueda
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Implementar menú
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
