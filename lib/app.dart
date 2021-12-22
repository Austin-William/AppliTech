import 'package:applitech/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:applitech/pages/home.dart';
import 'package:applitech/pages/login.dart';
import 'package:applitech/pages/routes/notes_page.dart';
import 'package:applitech/pages/routes/settings_page.dart';
import 'package:applitech/pages/routes/profile_page.dart';
import 'package:applitech/pages/routes/help_page.dart';
import 'package:applitech/global/variables.dart' as global;

class AppliTech extends StatefulWidget {
  const AppliTech({Key? key}) : super(key: key);

  @override
  State<AppliTech> createState() => _AppliTechState();
}

class _AppliTechState extends State<AppliTech> {
  ThemeData darkTheme = ThemeData(
    shadowColor: Colors.amberAccent,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.grey[900],
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      textTheme: ButtonTextTheme.primary,
      disabledColor: Colors.grey,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.amber),
    colorScheme: const ColorScheme.dark(
      primary: Colors.amber,
      primaryVariant: Colors.amberAccent,
      secondary: Colors.amberAccent,
      secondaryVariant: Colors.amber,
      surface: Colors.amber,
      background: Colors.amber,
      error: Colors.red,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.black,
      brightness: Brightness.dark,
    ),
  );

  ThemeData lightTheme = ThemeData(
    shadowColor: Colors.black12,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey[200],
    backgroundColor: Colors.white,
    selectedRowColor: Colors.blueAccent,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
      disabledColor: Colors.grey,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.blue),
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      primaryVariant: Colors.blueAccent,
      secondary: Colors.blue,
      secondaryVariant: Colors.blueAccent,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppliTech',
      theme: global.isThemeDark ? darkTheme : lightTheme,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('AppliTech'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                setState(
                  () {
                    global.isThemeDark = !global.isThemeDark;
                  },
                );
              },
            ),
          ],
        ),
        body: global.isLoggedIn ? const Home() : const Login(),
      ),
      routes: {
        '/applitech': (context) => const AppliTech(),
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
