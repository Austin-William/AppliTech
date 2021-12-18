import 'package:flutter/material.dart';
import 'package:applitech/components/appbar.dart';
import 'package:applitech/components/drawer.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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

            const SizedBox(
              height: 100,
            ),
            const Text(
              'Développé par :',
            ),
            const SizedBox(
              height: 20,
            ),
            // Copier cette partie pour ajouter votre nom, j'ai la flemme de chercher dans vos Github
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/55129304?v=4'),
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Austin-William Lo',
                ),
              ],
            ),
            // Fin de la partie à copier
          ],
        ),
      ),
    );
  }
}
