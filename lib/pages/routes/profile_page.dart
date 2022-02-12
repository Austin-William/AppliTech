import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';
import 'package:applitech/global/variables.dart' as global;

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
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.timelapse),
              title: const Text('GPA'),
              subtitle: Text(global.userData['gpa'].toString()),
            ),
            shadowColor: Colors.grey,
          ),
          Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.timelapse),
              title: const Text('Année'),
              subtitle: Text(global.userData['studentyear'].toString()),
            ),
            shadowColor: Colors.grey,
          ),
          Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.timelapse),
              title: const Text('Temps de connexion'),
              subtitle: Text(global.userData['nsstat']['active'].toString()),
            ),
            shadowColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
