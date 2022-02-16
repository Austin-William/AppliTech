import 'package:applitech/pages/routes/calendar_page.dart';
import 'package:applitech/pages/routes/module_page.dart';
import 'package:applitech/pages/routes/notifications_page.dart';
import 'package:applitech/pages/routes/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';
import 'package:applitech/global/variables.dart' as global;

// Affiche la page d'accueil avec les tabview

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: const CustomAppBar(
        title: 'Epitech',
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // barre de navigation fixe, si 'fixed' changed to 'shifting' => barre de nav devient blanche
        currentIndex: nbIndex,
        backgroundColor: global.isThemeDark ? Colors.black : Colors.white12,
        iconSize: 18,
        selectedIconTheme: IconThemeData(
          color: global.isThemeDark
              ? Colors.amberAccent
              : Colors
                  .blue, // change pas de couleur avec plus de 4 tabs => bug de Flutter d'après Github
          size: 26,
        ),
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: false, // set à true pour afficher les labels
        selectedFontSize: 12,
        selectedItemColor:
            global.isThemeDark ? Colors.amberAccent : Colors.blue,
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
              Icons.calendar_today,
            ),
            label: "Calendrier",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timeline,
            ),
            label: "Projets",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.label_important,
            ),
            label: "Modules",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: "Notifications",
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
            child: CalendarPage(),
          ),
          Center(
            child: ProjectsPage(),
          ),
          Center(
            child: ModulePage(),
          ),
          Center(
            child: NotificationsPage(),
          ),
        ],
      ),
    );
  }
}
