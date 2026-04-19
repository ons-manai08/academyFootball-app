import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Communication extends StatelessWidget {
  final List<Map<String, dynamic>> coachs = [
    {
      "nom": "Coach 1",
      "specialite": "Entraîneur de gardien de but",
      "tel": "+1234567890",
      "email": "coach1@example.com",
    },
    {
      "nom": "Coach 2",
      "specialite": "Entraîneur de la condition physique",
      "tel": "+0987654321",
      "email": "coach2@example.com",
    },
    {
      "nom": "Coach 3",
      "specialite": "Entraîneur tactique",
      "tel": "+9876543210",
      "email": "coach3@example.com",
    },
  ];
  final List<Map<String, dynamic>> joueurs = [
    {
      "nom": "Joeur 1",
      "tel": "+1234567890",
      "email": "coach1@example.com",
    },
    {
      "nom": "Joueur 2",
      "tel": "+0987654321",
      "email": "coach2@example.com",
    },
    {
      "nom": "Joueur 3",
      "tel": "+9876543210",
      "email": "coach3@example.com",
    },
  ];
  void _sendEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible d\'envoyer un e-mail à $email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Contact'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Text(
            'Liste des coachs',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Column(
            children: [
              for (final coach in coachs)
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coach['nom'],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(coach['specialite']),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 5.0),
                              Text(coach['tel']),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              Icon(Icons.email),
                              SizedBox(width: 5.0),
                              Text(coach['email']),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {
                          _sendEmail(coach['email']);
                          // Ouvre l'application de messagerie pour envoyer un e-mail au coach
                          // Remarque : cela nécessite une configuration supplémentaire pour fonctionner
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            'Liste des coachs',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Column(
            children: [
              for (final joueur in joueurs)
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            joueur['nom'],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 5.0),
                              Text(joueur['tel']),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              Icon(Icons.email),
                              SizedBox(width: 5.0),
                              Text(joueur['email']),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {
                          _sendEmail(joueur['email']);
                          // Ouvre l'application de messagerie pour envoyer un e-mail au coach
                          // Remarque : cela nécessite une configuration supplémentaire pour fonctionner
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),

        ],
      ),
    );
  }
}


