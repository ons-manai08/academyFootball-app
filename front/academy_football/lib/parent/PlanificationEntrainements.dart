import 'package:academy_football/controller/entrainement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanificationEntrainement extends StatelessWidget {
  /*final List<Map<String, dynamic>> prochainsEntrainements = [
    {
      "date": "2023-04-03",
      "heure": "10:00",
      "lieu": "Stade Municipal",
      "coach": "Coach 1",
    },
    {
      "date": "2023-04-05",
      "heure": "14:00",
      "lieu": "Centre Sportif",
      "coach": "Coach 2",
    },
    {
      "date": "2023-04-07",
      "heure": "16:00",
      "lieu": "Terrain de Foot",
      "coach": "Coach 1",
    },
    {
      "date": "2023-04-10",
      "heure": "09:00",
      "lieu": "Stade Municipal",
      "coach": "Coach 3",
    },
  ];*/
  @override
  Widget build(BuildContext context) {
    Get.find<EntrainController>().getEntrainementList();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Emploi du temps'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          //honi bech nhot l getBuilder eli hiya bech twali trenorni tableau
          GetBuilder<EntrainController>(builder: (controller) {
            return Table(
              border: TableBorder.all(),
              columnWidths: const {
                /* 0: FixedColumnWidth(100),
              1: FixedColumnWidth(100),
              2: FixedColumnWidth(150),
              3: FixedColumnWidth(100),*/
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Text('Date'),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text('Heure'),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text('Lieu'),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text('Type'),
                      ),
                    ),
                  ],
                ),
                for (final entrainement in controller.entrainementList)
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Text(entrainement.date.toString()),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(entrainement.lieu.toString()),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(entrainement.heure.toString()),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(entrainement.type.toString()),
                        ),
                      ),
                    ],
                  ),
              ],
            );
          },)

        ],
      ),
    );
  }
}
