import 'package:flutter/material.dart';
import 'package:applitech/global/variables.dart' as global;

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
        children: [
          for (var i = 0; i < global.homeData['board']['modules'].length; i++)
            ListTile(
              title: Text(
                global.homeData['board']['modules'][i]['title'],
              ),
              subtitle: Text(
                global.homeData['board']['modules'][i]['timeline_start'] +
                    " - " +
                    global.homeData['board']['modules'][i]['timeline_end'],
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
