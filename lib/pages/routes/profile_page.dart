import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';

// Affiche la page d'accueil avec les tabview

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profil',
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: const <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.timelapse),
              title: Text('Temps de connexion'),
              subtitle: Text('2 heures'),
            ),
            shadowColor: Colors.grey,
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.person_off),
              title: Text('Absences'),
              subtitle: Text('2 absences'),
            ),
            shadowColor: Colors.grey,
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.flag_sharp),
              title: Text('Flags'),
              subtitle: Text('2 flags'),
            ),
            shadowColor: Colors.grey,
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.person_pin_circle_rounded),
              title: Text('Binômes'),
              subtitle: Text('2 binômes'),
            ),
            shadowColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
