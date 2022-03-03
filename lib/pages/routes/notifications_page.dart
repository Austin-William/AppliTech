import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:applitech/components/drawer.dart';
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
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          for (var i = 0; i < global.notificationsData.length; i++)
            Card(
              child: ListTile(
                title: Html(
                  data: global.notificationsData[i]['title'],
                  style: {
                    'body': Style(
                      fontSize: const FontSize(18),
                    ),
                  },
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
            ),
        ],
      ),
    );
  }
}
