import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:applitech/global/variables.dart' as global;

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
            icon: Icon(
              Icons.menu,
              color: global.isThemeDark ? Colors.white : Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          color: global.isThemeDark ? Colors.white : Colors.black,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:
            global.isThemeDark ? Colors.transparent : Colors.black12,
        statusBarIconBrightness:
            global.isThemeDark ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            global.isThemeDark ? Brightness.light : Brightness.dark,
      ),
      backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
      shadowColor: global.isThemeDark ? Colors.white : Colors.black,
    );
  }
}
