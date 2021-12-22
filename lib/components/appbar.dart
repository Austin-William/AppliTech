import 'package:flutter/material.dart';
import 'package:applitech/global/variables.dart' as global;

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
      elevation: 4,
      shadowColor: global.isThemeDark ? Colors.grey[900] : Colors.grey[200],
    );
  }
}
