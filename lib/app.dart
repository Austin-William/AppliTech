import 'package:flutter/material.dart';
import 'package:applitech/pages/home.dart';
import 'package:applitech/pages/login.dart';
import 'package:applitech/pages/routes/notes_page.dart';
import 'package:applitech/pages/routes/settings_page.dart';
import 'package:applitech/pages/routes/profile_page.dart';
import 'package:applitech/pages/routes/help_page.dart';

class AppliTech extends StatelessWidget {
  const AppliTech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppliTech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/notes': (context) => const NotesPage(),
        '/settings': (context) => const SettingsPage(),
        '/profile': (context) => const ProfilePage(),
        '/help': (context) => const HelpPage(),
      },
    );
  }
}
