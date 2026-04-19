class MatchModel {
  int? id;
  String? dateMatch;
  String? heure;
  String? lieu;
  String? equipeHome;
  String? adversaire;

  MatchModel(
      {this.id,
        this.dateMatch,
        this.heure,
        this.lieu,
        this.equipeHome,
        this.adversaire});

  MatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateMatch = json['dateMatch'];
    heure = json['heure'];
    lieu = json['lieu'];
    equipeHome = json['equipeHome'];
    adversaire = json['adversaire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateMatch'] = this.dateMatch;
    data['heure'] = this.heure;
    data['lieu'] = this.lieu;
    data['equipeHome'] = this.equipeHome;
    data['adversaire'] = this.adversaire;
    return data;
  }
}