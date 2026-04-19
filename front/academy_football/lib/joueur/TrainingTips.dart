import 'package:flutter/material.dart';

class TrainingTips extends StatelessWidget {
  final List<Map<String, String>> tipsList = [
    {
      'image':'images/cons1.png',
      'title': 'Conseil 1',
      'text': '« Pour améliorer votre jeu, il est important de vous entraîner régulièrement et de manière efficace. '
          'Commencez par établir des objectifs clairs pour chaque séance d’entraînement et travaillez sur les aspects de votre jeu qui nécessitent le plus de travail. '
          'N’oubliez pas de prendre des pauses régulières pour éviter les blessures et de vous nourrir correctement pour maintenir votre énergie pendant l’entraînement. '
          'Enfin, n’ayez pas peur de demander des conseils à votre entraîneur ou à vos coéquipiers pour vous aider à progresser. »',
    },
    {
      'image': 'images/cons2.png',
      'title': 'Conseil 2',
      'text': '« Pour maintenir une alimentation saine, il est important de consommer une variété d’aliments riches en nutriments.'
          ' Essayez de manger une variété de fruits et légumes de différentes couleurs pour vous assurer d’obtenir une gamme de nutriments et de vitamines. '
          'Les protéines sont également importantes, alors essayez de manger une source de protéines à chaque repas, comme des viandes maigres, des légumineuses ou du tofu.'
          ' Enfin, limitez votre consommation d’aliments transformés et sucrés, et assurez-vous de boire suffisamment d’eau tout au long de la journée. »',
    },
    {
      'image': 'images/cons3.png',
      'title': 'Conseil 3',
      'text': '« Le conseil du jour est de travailler votre endurance en courant régulièrement. '
          'Une bonne endurance vous permettra de jouer à votre meilleur niveau tout au long du match. '
          'Essayez de courir 30 minutes par jour et augmentez progressivement la durée et l’intensité de vos courses pour améliorer votre endurance. '
          'N’oubliez pas de vous hydrater régulièrement et de manger des aliments sains pour soutenir vos performances sur le terrain. »',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Conseils d\'entraînement'),
      ),
      body: ListView.builder(
        itemCount: tipsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _navigateToTip(context, tipsList[index]),
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    tipsList[index]['image']!,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  ListTile(
                    title: Text(tipsList[index]['title']!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToTip(BuildContext context, Map<String, String> tip) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TipDetailsPage(
          image: tip['image']!,
          title: tip['title']!,
          text: tip['text']!,
        ),
      ),
    );
  }
}

class TipDetailsPage extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  TipDetailsPage({
    required this.image,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
      ),
      body: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
