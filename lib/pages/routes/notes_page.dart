import 'package:flutter/material.dart';
import 'package:applitech/global/variables.dart' as global;

// Affiche la page d'accueil avec les tabview

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (var i = 0; i < global.homeData['current'].length; i++)
            ListTile(
              title: Text(
                global.homeData['current'][i]['code_module'],
              ),
              subtitle: Text(
                "Semestre : " + global.homeData['current'][i]['semester_code'],
              ),
              leading: Text(
                "crédits : " + global.homeData['current'][i]['credits'],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 65, 65),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
