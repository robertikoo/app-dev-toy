import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  List<MenuItem> get _menuItems => [
        MenuItem(
          title: 'Mi perfil',
          route: '/profile',
          icon: Icons.person_outline,
        ),
        MenuItem(
          title: 'Configuración',
          route: '/settings',
          icon: Icons.settings_outlined,
        ),
        MenuItem(
          title: 'Ingresos',
          route: '/income',
          icon: Icons.attach_money_outlined,
        ),
        MenuItem(
          title: 'Ayuda',
          route: '/help',
          icon: Icons.help_outline,
        ),
        MenuItem(
          title: 'Evalúa tu experiencia',
          route: '/rate',
          icon: Icons.star_outline,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _menuItems.length,
      itemBuilder: (context, index) {
        final item = _menuItems[index];
        return ListTile(
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () {
            Navigator.pop(context); // Close drawer
            if (item.route != Navigator.of(context).widget.initialRoute) {
              Navigator.pushNamed(context, item.route);
            }
          },
        );
      },
    );
  }
} 