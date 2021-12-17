import 'package:flutter/material.dart';
import 'package:applitech/pages/home.dart';
import 'package:applitech/pages/login.dart';
import 'package:applitech/pages/routes/notes_page.dart';

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
        '/': (context) => const Login(),
        '/home': (context) => const Home(),
        'notes': (context) => const NotesPage(),
      },
    );
  }
}
