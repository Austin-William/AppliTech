import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';
import 'package:applitech/global/variables.dart' as global;

// Affiche la page d'accueil avec les tabview

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Widget displayInfoCard(String title, String info, Icon icon) {
    return(
      Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: icon,
          title: Text(title),
          subtitle: Text(info),
        ),
        shadowColor: Colors.grey,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profil',
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: <Widget>[
          displayInfoCard('GPA', global.userData['gpa'][0]['gpa'].toString(), const Icon(Icons.bookmark_outline)),
          displayInfoCard('Cycle', global.userData['gpa'][0]['cycle'], const Icon(Icons.school)),
          displayInfoCard('Année', global.userData['studentyear'].toString() + "ème année", const Icon(Icons.date_range)),
          displayInfoCard('Temps de connexion', global.userData['nsstat']['active'].toString() + " h/semaine", const Icon(Icons.timelapse)), 
          displayInfoCard('XPs', /* mettre les valeurs */'acquis : ' + '| en cours : ', const Icon(Icons.stars_rounded)),
        ],
      ),
    );
  }
}
