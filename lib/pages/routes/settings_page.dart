import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
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
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text('Langue'),
            subtitle: Text('Français'),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.timer_outlined),
            title: const Text('Actvités'),
            subtitle:
                const Text('Avertissement avant une activité (en jours) :'),
            trailing: NumberPicker(
              value: global.timerActivityComing,
              minValue: 0,
              maxValue: 7,
              onChanged: (value) =>
                  setState(() => global.timerActivityComing = value),
            ),
          ),
          const SizedBox(height: 20),
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
