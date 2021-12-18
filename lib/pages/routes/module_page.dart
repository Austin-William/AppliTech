import 'package:flutter/material.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Card(
            margin: EdgeInsets.all(8),
            shadowColor: Colors.grey,
            child: ListTile(
              title: Text('module name'),
              subtitle: Text(
                'List of projects',
              ), // boucle for qui affiche les projets inscrits
            ),
          ),
        ],
      ),
    );
  }
}
