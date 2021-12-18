import 'package:applitech/pages/routes/calendar_page.dart';
import 'package:applitech/pages/routes/home_page.dart';
import 'package:applitech/pages/routes/module_page.dart';
import 'package:applitech/pages/routes/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';

// Affiche la page d'accueil avec les tabview

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // couleur de fond
      appBar: const CustomAppBar(
        title: 'Paramètres',
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Calendrier'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Modules'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ModulePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Projets'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjectsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
