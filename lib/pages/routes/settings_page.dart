import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';
import 'package:applitech/global/variables.dart' as global;

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
          // ListTile(
          //   leading: const Icon(Icons.light_mode_outlined),
          //   title: SwitchListTile(
          //     title: const Text('Mode sombre'),
          //     value: global.isThemeDark,
          //     onChanged: (bool value) {
          //       setState(
          //         () {
          //           global.isThemeDark = value;
          //         },
          //       );
          //     },
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          const ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text('Langue'),
            subtitle: Text('Français'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Center(
              child: Text(
                'Les modifications prendront effet après redémarrage de l\'application',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Version ${global.version}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
