import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataAnalysisPage extends StatelessWidget {
  final List<Map<String, dynamic>> statsPhysiques = [
    {
      "nom": "Joueur 1",
      "vitesse": 80,
      "endurance": 70,
      "puissance": 85,
    },
    {
      "nom": "Joueur 2",
      "vitesse": 90,
      "endurance": 65,
      "puissance": 75,
    },
    {
      "nom": "Joueur 3",
      "vitesse": 75,
      "endurance": 80,
      "puissance": 90,
    },
  ];

  final List<Map<String, dynamic>> statsTactiques = [
    {
      "nom": "Joueur 1",
      "positionnement": 75,
      "interceptions": 70,
      "marquage": 85,
    },
    {
      "nom": "Joueur 2",
      "positionnement": 85,
      "interceptions": 65,
      "marquage": 80,
    },
    {
      "nom": "Joueur 3",
      "positionnement": 70,
      "interceptions": 80,
      "marquage": 90,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Statistiques'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Statistiques physiques', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 16.0),
            BarChart(
              data: statsPhysiques,
              labelField: 'nom',
              fields: ['vitesse', 'endurance', 'puissance'],
              label: 'Moyenne des statistiques physiques',
            ),
            SizedBox(height: 32.0),
            Text('Statistiques tactiques', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 16.0),
            BarChart(
              data: statsTactiques,
              labelField: 'nom',
              fields: ['positionnement', 'interceptions', 'marquage'],
              label: 'Moyenne des statistiques tactiques',
            ),
          ],
        ),
      ),
    );
  }
}

class BarChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final String labelField;
  final List<String> fields;
  final String label;

  BarChart(
      {required this.data, required this.labelField, required this.fields, required this.label});

  List<charts.Series<dynamic, String>> _createSeries() {
    return fields.map((field) {
      return charts.Series<Map<String, dynamic>, String>(
        id: field,
        domainFn: (datum, _) => datum[labelField],
        measureFn: (datum, _) => datum[field],
        data: data,
        labelAccessorFn: (datum, _) => '${datum[labelField]}: ${datum[field]}',
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: charts.BarChart(
        _createSeries(),
        barGroupingType: charts.BarGroupingType.grouped,
        behaviors: [
          charts.SeriesLegend(
            position: charts.BehaviorPosition.bottom,
          ),
        ],
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelRotation: 60,
          ),
        ),
      ),
    );
  }
}


