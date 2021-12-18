import 'package:applitech/pages/routes/calendar_page.dart';
import 'package:applitech/pages/routes/home_page.dart';
import 'package:applitech/pages/routes/module_page.dart';
import 'package:applitech/pages/routes/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';

// Affiche la page d'accueil avec les tabview

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int nbIndex = 0;
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(
      initialPage: nbIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // couleur de fond
      appBar: const CustomAppBar(
        title: 'Paramètres',
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // barre de navigation fixe, si 'fixed' changed to 'shifting' => barre de nav devient blanche
        currentIndex: nbIndex,
        backgroundColor: Colors.white12,
        iconSize: 18,
        selectedIconTheme: const IconThemeData(
          color: Colors
              .amberAccent, // change pas de couleur avec plus de 4 tabs => bug de Flutter d'après Github
          size: 26,
        ),
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: false, // set a true pour afficher les labels
        selectedFontSize: 12,
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) {
          pageController!.animateToPage(index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.grey,
            ),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.grey,
            ),
            label: "Calendrier",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timeline,
              color: Colors.grey,
            ),
            label: "Projets",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.label_important,
              color: Colors.grey,
            ),
            label: "Modules",
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            nbIndex = page;
          });
        },
        children: const <Widget>[
          Center(
            child: HomePage(),
          ),
          Center(
            child: CalendarPage(),
          ),
          Center(
            child: ProjectsPage(),
          ),
          Center(
            child: ModulePage(),
          ),
        ],
      ),
    );
  }
}
