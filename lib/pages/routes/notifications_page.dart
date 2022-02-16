import 'package:flutter/material.dart';
import 'package:applitech/components/drawer.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/global/variables.dart' as global;

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Notes',
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          for (var i = 0; i < global.notificationsData.length; i++)
            ListTile(
              title: Text(
                global.notificationsData[i]['title'],
              ),
              subtitle: Text(
                "par " + global.notificationsData[i]['user']['title'],
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
