import 'package:flutter/material.dart';

// Appbar personnalisé en tant que component pour pouvoir l'implémenter partout

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  })  : preferredSize = const Size.fromHeight(45),
        super(key: key);

  final String title;

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
