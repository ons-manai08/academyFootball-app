import 'package:flutter/material.dart';

class GestionEquipesJoueurs extends StatefulWidget {
  @override
  _GestionEquipesJoueursState createState() => _GestionEquipesJoueursState();
}

class _GestionEquipesJoueursState extends State<GestionEquipesJoueurs> {
  Map<String, List<Map<String, String>>> equipes = {
    'Equipe A': [
      {'nom': 'Joueur A1', 'poste': 'Attaquant'},
      {'nom': 'Joueur A2', 'poste': 'Défenseur'},
      {'nom': 'Joueur A3', 'poste': 'Milieu de terrain'},
    ],
    'Equipe B': [
      {'nom': 'Joueur B1', 'poste': 'Attaquant'},
      {'nom': 'Joueur B2', 'poste': 'Défenseur'},
      {'nom': 'Joueur B3', 'poste': 'Milieu de terrain'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Gestion des équipes et des joueurs'),
      ),
      body: ListView.builder(
        itemCount: equipes.length,
        itemBuilder: (BuildContext context, int index) {
          String equipe = equipes.keys.elementAt(index);
          List<Map<String, String>> joueurs = equipes[equipe]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  equipe,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: joueurs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, String> joueur = joueurs[index];
                  return ListTile(
                    title: Text(joueur['nom']!),
                    subtitle: Text(joueur['poste']!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // TODO: Implémenter la logique de modification des informations du joueur
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(joueur['nom']!),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Prénom: ${joueur['prenom']}'),
                                      Text('Poste: ${joueur['poste']}'),
                                      // Ajouter d'autres informations personnelles du joueur ici
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
