import 'package:academy_football/controller/entrainement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/match_controller.dart';
import 'EditTrainingPage.dart';

class PlanificationEntrainements extends StatefulWidget {
  @override
  _PlanificationEntrainementsState createState() =>
      _PlanificationEntrainementsState();
}

class _PlanificationEntrainementsState
    extends State<PlanificationEntrainements> {
  List<Training> _trainings = [
    Training(
        day: DateTime(2022, 4, 25),
        time: TimeOfDay(hour: 8, minute: 0),
        place: 'Stadium A',
        team: 'Team A',
        type: 'Conditioning'),
    Training(
        day: DateTime(2022, 4, 27),
        time: TimeOfDay(hour: 10, minute: 0),
        place: 'Stadium B',
        team: 'Team B',
        type: 'Tactics'),
    Training(
        day: DateTime(2022, 4, 29),
        time: TimeOfDay(hour: 14, minute: 0),
        place: 'Stadium A',
        team: 'Team A',
        type: 'Physical Training'),
  ];
  List<Match> _matches = [
    Match(
        Date: DateTime(2022, 5, 1),
        heure: TimeOfDay(hour: 16, minute: 0),
        lieu: 'Stadium C',
        EquipeHome: 'Team A',
        Adversaire: 'Team B'),

  ];


  @override
  Widget build(BuildContext context) {
    Get.find<EntrainController>().getEntrainementList();
    Get.find<MatchController>().getMatchtList();
    print(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Planification des entrainements'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        child: Row( children: [Icon(Icons.add,size: 20) ,SizedBox(width: 10), Text("Add")],))
                  ],),
                ),
                GetBuilder<EntrainController>(builder:(controller) {
                  return  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor:
                            MaterialStateProperty.all(Color.fromARGB(255, 195, 113, 122)),
                            columns: [
                              DataColumn(label: Text('Date')),
                              DataColumn(label: Text('Heure')),
                              DataColumn(label: Text('Lieu')),
                              DataColumn(label: Text('Equipe')),
                              DataColumn(label: Text('Type')),
                              DataColumn(label: Text('Update')),
                              DataColumn(label: Text('Delete')),
                            ],
                            rows: controller.entrainementList
                                .map(
                                  (training) => DataRow(cells: [

                                    DataCell(Text(training.date.toString())),
                                    DataCell(Text(training.heure.toString())),

                                    DataCell(Text(training.lieu.toString())),
                                DataCell(Text(training.equipe.toString())),
                                DataCell(Text(training.type.toString())),
                                DataCell(IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () => {
                                    //honi bech nedi methode te3i men backend
                                  },
                                )),
                                DataCell(IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => {},
                                )),

                              ]),
                            )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ) ;
                },),


                SizedBox(height: 30), // Espacement entre les deux tableau

                Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  child: Text(
                    'Planifications des matchs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                          child: Row( children: [Icon(Icons.add,size: 20) ,SizedBox(width: 10), Text("Add")],))
                    ],),
                ),
                GetBuilder<MatchController>(builder: (controller) {
                  return  Row(
                      children: [
                      Expanded(
                      child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                      headingRowColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 195, 113, 122)),
                  columns: [
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Heure')),
                      DataColumn(label: Text('Lieu')),
                      DataColumn(label: Text('EquipeHome')),
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('')),

                    ],
                      rows: controller.matchtList

                        .map(
                          (training) => DataRow(cells: [
                       DataCell(Text(training.dateMatch.toString())),
                        DataCell(Text(training.heure.toString())),
                        DataCell(Text(training.lieu.toString())),
                        DataCell(Text(training.equipeHome.toString())),
                        DataCell(Text(training.adversaire.toString())),
                        DataCell(IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => {},
                        )),
                            DataCell(IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => {},
                            )),

                          ]),
                      )
                          .toList(),
                      ),
                      ),
                      ),
                      ],
                  ) ;
                },),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Training {
  String place;
  String team;
  String type;
  DateTime day;
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);

  Training({
    required this.place,
    required this.team,
    required this.type,
    required this.day,
    required this.time,
  });

  factory Training.fromJson(Map<String, dynamic> json) {
    return Training(
      place: json['place'],
      team: json['team'],
      type: json['type'],
      day: DateTime.parse(json['day']),
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() => {
        'place': place,
        'team': team,
        'type': type,
        'day': day.toIso8601String(),
        'time': time,
      };
}
class Match {
  String lieu;
  String EquipeHome;
  String Adversaire;
  DateTime Date;
  TimeOfDay heure = TimeOfDay(hour: 10, minute: 30);

  Match({
    required this.lieu,
    required this.EquipeHome,
    required this.Adversaire,
    required this.Date,
    required this.heure,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      Adversaire: json['adversaire'],
      lieu: json['lieu'],
      heure: json['heure'],
      EquipeHome: json['EquipeHome'],
      Date: DateTime.parse(json['Date']),
    );
  }

  Map<String, dynamic> toJson() => {
    'Adversaire': Adversaire,
    'lieu': lieu,
    'heure': heure,
    'EquipeHome': EquipeHome,
    'Date': Date.toIso8601String(),

  };
}

