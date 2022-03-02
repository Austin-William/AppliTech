import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  Widget displayDevelopperInfo(String name, String pictureUrl)
  {
    return (
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              image: NetworkImage(pictureUrl),
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(width: 8),
          Text(name),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Aide',
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            Card(
              elevation: 0,
              shadowColor: Colors.grey,
              margin: const EdgeInsets.all(16),
              color: Colors.white12,
              child: Column(
                children: const [
                  Text(
                    'En cas de problème lié à l\'application, veuillez contacter l\'équipe de développement ou votre APE.',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'L\'équipe de développement est disponible sur le Github de l\'application.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            const Text('Développé par :'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    displayDevelopperInfo('Austin-William Lo', 'https://avatars.githubusercontent.com/u/55129304?v=4'),
                    const SizedBox(height: 10),
                    displayDevelopperInfo('Chloé Chauvin', 'https://avatars.githubusercontent.com/Nekory23'),
                    const SizedBox(height: 10),
                    displayDevelopperInfo('Quentin Treheux', 'https://avatars.githubusercontent.com/LuciferBahamut'),
                    const SizedBox(height: 10),
                    displayDevelopperInfo('Vincent Pichot', 'https://avatars.githubusercontent.com/Vincent-pichot'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
