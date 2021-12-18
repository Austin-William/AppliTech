import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 300,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
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
                      child: const Image(
                        image: NetworkImage(
                          'https://avatars2.githubusercontent.com/u/17098477?s=460&v=4',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Firstname Lastname',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'example@epitech.eu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "120 " "credits",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profil"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notes),
            title: const Text("Notes"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/notes');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Paramètres"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Se déconnecter"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
