import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget implements PreferredSizeWidget {
  const FilterChips({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Bandeja Chat'),
      centerTitle: true,
      // Aquí puedes agregar más propiedades del AppBar según necesites
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
