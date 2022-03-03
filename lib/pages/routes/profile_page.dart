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

  int computeXp() {
    int xpTalk = 0;
    int xpWorkshop = 0;
    int xpHackathon = 0;

    dynamic activities = global.hubAct['activites'];
    dynamic activitiesfr = global.hubActFR['activites'];
    
    for (var i = 0; i < activities.length; i++)
    {
      if (activities[i]['type_title'] == "Talk") {
        dynamic status = activities[i]['events'];
        for (var j = 0; j < status.length; j++)
          if (status[j]['user_status'] == "present") {
            if (xpTalk < 15)
              xpTalk += 1;
          }
      }
      if (activities[i]['type_title'] == "Workshop") {
        dynamic status = activities[i]['events'];
        for (var j = 0; j < status.length; j++)
          if (status[j]['user_status'] == "present") {
            if (xpWorkshop < 20)
              xpWorkshop += 2;
          }
      }
      if (activities[i]['type_title'] == "Hackathon") {
        dynamic status = activities[i]['events'];
        for (var j = 0; j < status.length; j++)
          if (status[j]['user_status'] == "present") {
            if (xpHackathon < 100)
              xpHackathon += 6;
          }
      }
    }

    for (var i = 0; i < activitiesfr.length; i++)
    {
      if (activitiesfr[i]['type_title'] == "Talk") {
        dynamic status = activitiesfr[i]['events'];
        for (var j = 0; j < status.length; j++)
          if (status[j]['user_status'] == "present") {
            if (xpTalk < 15)
              xpTalk += 1;
          }
      }
      if (activitiesfr[i]['type_title'] == "Workshop") {
        dynamic status = activitiesfr[i]['events'];
        for (var j = 0; j < status.length; j++)
          if (status[j]['user_status'] == "present") {
            if (xpWorkshop < 20)
              xpWorkshop += 2;
          }
      }
      if (activitiesfr[i]['type_title'] == "Hackathon") {
        dynamic status = activitiesfr[i]['events'];
        for (var j = 0; j < status.length; j++)
          if (status[j]['user_status'] == "present") {
            if (xpHackathon < 100)
              xpHackathon += 6;
          }
      }
    }
    return xpTalk + xpWorkshop + xpHackathon;
  }


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
          displayInfoCard('XPs', 'acquis : ' + computeXp().toString(), const Icon(Icons.stars_rounded)),
        ],
      ),
    );
  }
}
