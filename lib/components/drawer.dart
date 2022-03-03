import 'package:flutter/material.dart';
import 'package:applitech/global/variables.dart' as global;

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Widget menuList(String title, String route, Icon icon) {
    if (route == "/applitech") global.isLoggedIn = false;
    return (ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        Navigator.of(context).popAndPushNamed(route);
      },
    ));
  }

  Widget displayInfoUser(String info, double size) {
    return (Text(
      info,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: global.isThemeDark ? Colors.black : Colors.white,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 300,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: global.isThemeDark ? Colors.amber : Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: global.isThemeDark ? Colors.grey : Colors.blueGrey,
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              padding: EdgeInsets.zero,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: NetworkImage(
                          global.autologinLink + global.userData['picture'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  displayInfoUser(global.userData['title'], 20),
                  const SizedBox(height: 20),
                  displayInfoUser(global.userData['login'], 16),
                  const SizedBox(height: 20),
                  displayInfoUser(
                      global.userData['credits'].toString() + " crédits", 16),
                ],
              ),
            ),
          ),
          menuList('Acceuil', '/home', const Icon(Icons.menu_book)),
          menuList('Profil', '/profile', const Icon(Icons.person)),
          menuList('Notes', '/notes', const Icon(Icons.notes)),
          menuList('Abscence', '/absences',
              const Icon(Icons.do_not_disturb_alt_outlined)),
          menuList('Paramètres', '/settings', const Icon(Icons.settings)),
          menuList('Aide', '/help', const Icon(Icons.help)),
          menuList(
              'Se déconnecter', '/applitech', const Icon(Icons.exit_to_app)),
        ],
      ),
    );
  }
}
