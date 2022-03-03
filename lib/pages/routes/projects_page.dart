import 'package:flutter/material.dart';
import 'package:applitech/global/variables.dart' as global;

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (var i = 0; i < global.homeData['board']['projets'].length; i++)
            Card(
              child: ListTile(
                title: Text(
                  global.homeData['board']['projets'][i]['title'],
                ),
                subtitle: Text(
                  global.homeData['board']['projets'][i]['timeline_start'] +
                      " - " +
                      global.homeData['board']['projets'][i]['timeline_end'],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
