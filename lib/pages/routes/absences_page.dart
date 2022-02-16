import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';
import 'package:applitech/global/variables.dart' as global;

class AbsencesPage extends StatefulWidget {
  const AbsencesPage({Key? key}) : super(key: key);

  @override
  _AbsencesPageState createState() => _AbsencesPageState();
}

class _AbsencesPageState extends State<AbsencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Absences',
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Absences les 7 derniers jours",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (global.absencesData['recents'] != null)
                for (var i = 0; i < global.absencesData['recents'].length; i++)
                  ListTile(
                    title: Text(
                      global.absencesData['recents'][i]['module_title'],
                    ),
                    subtitle: Text(
                      global.absencesData['recents'][i]['acti_title'],
                    ),
                    leading: Text(
                      global.absencesData['recents'][i]['categ_title'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 65, 65, 65),
                      ),
                    ),
                  ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const Text(
                "Autres absences",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (global.absencesData['others'] != null)
                for (var i = 0; i < global.absencesData['others'].length; i++)
                  ListTile(
                    title: Text(
                      global.absencesData['others'][i]['module_title'],
                    ),
                    subtitle: Text(
                      global.absencesData['others'][i]['acti_title'],
                    ),
                    leading: Text(
                      global.absencesData['others'][i]['categ_title'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 65, 65, 65),
                      ),
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
