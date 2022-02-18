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
    global.currentDate =
        DateTime.now().add(Duration(days: global.timerActivityComing));
    return Scaffold(
      body: ListView(
        children: [
          for (var i = 0; i < global.calendarData.length; i++) ...[
            if (global.calendarData[i]['start'] == global.currentDate) ...[
              AlertDialog(
                title: const Text('Alerte !'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text("L'activité " +
                          global.calendarData[i]['titlemodule'] +
                          " va commencer dans 5 minutes !"),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  global.calendarData[i]['titlemodule'],
                  textAlign: TextAlign.center,
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(global.calendarData[i]['type_title']),
                    Text(
                      global.calendarData[i]['start'] +
                          " - " +
                          global.calendarData[i]['end'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 65, 65, 65),
                      ),
                    ),
                    if (global.calendarData[i]['room'] != null)
                      if (global.calendarData[i]['room']['code'] != null)
                        Text("Salle : " +
                            global.calendarData[i]['room']['code']),
                    if (global.calendarData[i]['room'] != null)
                      if (global.calendarData[i]['room']['seats'] != null)
                        Text("Nombre de places : " +
                            global.calendarData[i]['room']['seats'].toString()),
                    Text(
                      "Nombre d'inscrits : " +
                          global.calendarData[i]['total_students_registered']
                              .toString(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
