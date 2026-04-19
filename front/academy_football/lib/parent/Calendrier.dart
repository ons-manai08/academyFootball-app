import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendrier extends StatelessWidget {

  final List<Map<String, dynamic>> evenements = [
    {      "titre": "Match contre l'équipe A",      "date": DateTime(2022, 4, 10, 14, 0),      "lieu": "Stade Municipal",      "coach": "Coach 1"    },
    {      "titre": "Tournoi inter-équipes",      "date": DateTime(2022, 4, 15, 9, 0),      "lieu": "Stade Régional",      "coach": "Coach 2"    },
    {      "titre": "Réunion Parents-Coachs",      "date": DateTime(2022, 4, 20, 18, 0),      "lieu": "Salle de Conférence",      "coach": "Coach 3"    },
  ];

  @override
  Widget build(BuildContext context) {
//controller honi bech yet7at  honi l getFind
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calendrier'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    'images/logo.png',
                    height: 80,
                  ),

                  SizedBox(height: 8.0),
                  Text(
                    'Consultez le calendrier ci-dessous pour connaître tous les événements importants à venir, comme les matchs, les tournois et les réunions.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: evenements.length,
              itemBuilder: (context, index) {
                final evenement = evenements[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(evenement['titre']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 8.0),
                            Text(
                              DateFormat.yMd().add_jm().format(evenement['date']),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 8.0),
                            Text(evenement['lieu']),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 8.0),
                            Text(evenement['coach']),
                          ],
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

