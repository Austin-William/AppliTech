import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class Preferences extends StatefulWidget {
//   Preferences({Key? key}) : super(key: key);

//   @override
//   _PreferencesState createState() => _PreferencesState();
// }

// class _PreferencesState extends State<Preferences> {
//   bool betaStatus = false;
//   bool videoAutoStatus = false;
//   bool feedStatus = false;
//   bool precenseStatus = false;
//   bool profanityStatus = false;
//   bool overStatus = false;
//   bool nsfwStatus = false;

  // void sendjs(String name, dynamic status) async {  
  //   var response = await http.patch(
  //     Uri.parse('https://oauth.reddit.com/api/v1/me/prefs'),
  //       body: jsonEncode({"$name": "$status"}),
  //       headers: {
  //         'Authorization': 'bearer ${global.token['access_token']}',
  //         'User-Agent': 'Redditech/1.0.0 (by /u/EauPlatePetillante)',
  //         'Content-Type': 'text/plain'
  //         },
  //   );
  // }

//   @override
//   Widget build(BuildContext context) {
//     betaStatus = global.settingsData['beta'];
//     videoAutoStatus = global.settingsData['video_autoplay'];
//     feedStatus = global.settingsData['feed_recommendations_enabled'];
//     precenseStatus = global.settingsData['show_presence'];
//     profanityStatus = global.settingsData['no_profanity'];
//     overStatus = global.settingsData['over_18'];
//     nsfwStatus = global.settingsData['label_nsfw'];
//     return Scaffold(
//         backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
//         appBar: AppBar(
//           title: preferencesTitle,
//           elevation: 0,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//               gradient: LinearGradient(
//                 colors: [Colors.orange, Colors.red],
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//               ),
//             ),
//           ),
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarColor: Colors.transparent,
//             statusBarIconBrightness: Brightness.light,
//             statusBarBrightness: Brightness.dark,
//           ),
//           backgroundColor: barUiColor,
//           shadowColor: shadowBarUiColor,
//         ),
//         body: ListView(
//           children: <Widget>[
//             SwitchListTile(
//               inactiveTrackColor:
//                   global.isThemeDark ? Colors.white : Colors.black,
//               title: Text(
//                 'Beta version',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: global.isThemeDark ? Colors.white : Colors.black,
//                 ),
//               ),
//               value: betaStatus,
//               onChanged: (value) {
//                 setState(
//                   () {
//                     global.settingsData['beta'] = value;
//                   },
//                 );
//                 sendjs('beta', global.settingsData['beta']);
//               },
//               activeTrackColor: Colors.orangeAccent,
//               activeColor: Colors.orange,
//             ),
//             SwitchListTile(
//               inactiveTrackColor:
//                   global.isThemeDark ? Colors.white : Colors.black,
//               title: Text(
//                 'Playing video auto',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: global.isThemeDark ? Colors.white : Colors.black,
//                 ),
//               ),
//               value: videoAutoStatus,
//               onChanged: (value) {
//                 setState(
//                   () {
//                     global.settingsData['video_autoplay'] = value;
//                   },
//                 );
//                 sendjs('video_autoplay', global.settingsData['video_autoplay']);
//               },
//               activeTrackColor: Colors.orangeAccent,
//               activeColor: Colors.orange,
//             ),
//             SwitchListTile(
//               inactiveTrackColor:
//                   global.isThemeDark ? Colors.white : Colors.black,
//               title: Text(
//                 'Enable feed recommendations',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: global.isThemeDark ? Colors.white : Colors.black,
//                 ),
//               ),
//               value: feedStatus,
//               onChanged: (value) {
//                 setState(
//                   () {
//                     global.settingsData['feed_recommendations_enabled'] = value;
//                   },
//                 );
//                 sendjs('feed_recommendations_enabled', global.settingsData['feed_recommendations_enabled']);
//               },
//               activeTrackColor: Colors.orangeAccent,
//               activeColor: Colors.orange,
//             ),
//             SwitchListTile(
//               inactiveTrackColor:
//                   global.isThemeDark ? Colors.white : Colors.black,
//               title: Text(
//                 'Show presence',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: global.isThemeDark ? Colors.white : Colors.black,
//                 ),
//               ),
//               value: precenseStatus,
//               onChanged: (value) {
//                 setState(
//                   () {
//                     global.settingsData['show_presence'] = value;
//                   },
//                 );
//                 sendjs('show_presence', global.settingsData['show_presence']);
//               },
//               activeTrackColor: Colors.orangeAccent,
//               activeColor: Colors.orange,
//             ),
//             SwitchListTile(
//               inactiveTrackColor:
//                   global.isThemeDark ? Colors.white : Colors.black,
//               title: Text(
//                 'No profanity',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: global.isThemeDark ? Colors.white : Colors.black,
//                 ),
//               ),
//               value: profanityStatus,
//               onChanged: (value) {
//                 setState(
//                   () {
//                     global.settingsData['no_profanity'] = value;
//                   },
//                 );
//                 sendjs('no_profanity', global.settingsData['no_profanity']);
//               },
//               activeTrackColor: Colors.orangeAccent,
//               activeColor: Colors.orange,
//             ),
//             SwitchListTile(
//               inactiveTrackColor:
//                   global.isThemeDark ? Colors.white : Colors.black,
//               title: Text(
//                 'Content 18+',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: global.isThemeDark ? Colors.white : Colors.black,
//                 ),
//               ),
//               value: overStatus,
//               onChanged: (value) {
//                 setState(
//                   () {
//                     global.settingsData['over_18'] = value;
//                   },
//                 );
//                 sendjs('over_18', global.settingsData['over_18']);
//               },
//               activeTrackColor: Colors.orangeAccent,
//               activeColor: Colors.orange,
//             ),
//             SwitchListTile(
//               inactiveTrackColor:
//                   global.isThemeDark ? Colors.white : Colors.black,
//               title: Text(
//                 'Label NSFW',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: global.isThemeDark ? Colors.white : Colors.black,
//                 ),
//               ),
//               value: nsfwStatus,
//               onChanged: (value) {
//                 setState(
//                   () {
//                     global.settingsData['label_nsfw'] = value;
//                   },
//                 );
//                 sendjs('label_nsfw', global.settingsData['label_nsfw']);
//               },
//               activeTrackColor: Colors.orangeAccent,
//               activeColor: Colors.orange,
//             ),
//             SwitchListTile(
//               inactiveTrackColor:
//                   global.isThemeDark ? Colors.white : Colors.black,
//               title: Text(
//                 'Dark mode',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: global.isThemeDark ? Colors.white : Colors.black,
//                 ),
//               ),
//               value: global.isThemeDark,
//               onChanged: (mode) {
//                 setState(
//                   () {
//                     global.isThemeDark = mode;
//                   },
//                 );
//                 // sendjs('feed_recommendations_enabled', global.settingsData['feed_recommendations_enabled']);
//               },
//               activeTrackColor: Colors.orangeAccent,
//               activeColor: Colors.orange,
//             ),
//           ],
//         )
//         // body: Text(
//         //   'Preferences',
//         //   style: TextStyle(
//         //     fontSize: 20,
//         //     fontWeight: FontWeight.bold,
//         // ),
//         // ),
//         );
//   }
// }
