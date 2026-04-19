import 'package:flutter/material.dart';

class Match {
  String Adversaire;
  String lieu ;
  String EquipeHome;
  DateTime Date;
  TimeOfDay heure = TimeOfDay(hour: 10, minute: 30);

  Match({
    required this.Adversaire,
    required this.lieu,
    required this.heure,
    required this.EquipeHome,
    required this.Date,

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
