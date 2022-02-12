import 'package:flutter/material.dart';
import 'package:applitech/global/variables.dart' as global;

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        for (var i = 0; i < global.homeData['board']['activites'].length; i++)
          ListTile(
            title: Text(global.homeData['activites'][i]['title']),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Module : " + global.homeData['activites'][i]['module']),
                Text("Date : " +
                    global.homeData['activites'][i]['timeline_start'] +
                    " - " +
                    global.homeData['activites'][i]['timeline_end']),
                Text("Salle : " + global.homeData['activites'][i]['salle']),
              ],
            ),
          ),
      ],
    ));
  }
}
