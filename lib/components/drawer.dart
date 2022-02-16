import 'package:flutter/material.dart';
import 'package:applitech/global/variables.dart' as global;

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
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
                  Text(
                    global.userData['title'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: global.isThemeDark ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    global.userData['login'],
                    style: TextStyle(
                      fontSize: 16,
                      color: global.isThemeDark ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    global.userData['credits'].toString() + " crédits",
                    style: TextStyle(
                      fontSize: 16,
                      color: global.isThemeDark ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Accueil"),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profil"),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notes),
            title: const Text("Notes"),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/notes');
            },
          ),
          ListTile(
            leading: const Icon(Icons.do_not_disturb_alt_outlined),
            title: const Text("Absences"),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/absences');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Paramètres"),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Aide"),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/help');
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Se déconnecter"),
            onTap: () {
              global.isLoggedIn = false;
              Navigator.of(context).popAndPushNamed('/applitech');
            },
          ),
        ],
      ),
    );
  }
}
