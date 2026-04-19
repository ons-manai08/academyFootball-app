class Entrainement {
  int? id;
  String? date;
  String? lieu;
  String? heure;
  String? equipe;
  String? type;

  Entrainement(
      {this.id, this.date, this.lieu, this.heure, this.equipe, this.type});

  Entrainement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    lieu = json['lieu'];
    heure = json['heure'];
    equipe = json['equipe'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['lieu'] = this.lieu;
    data['heure'] = this.heure;
    data['equipe'] = this.equipe;
    data['type'] = this.type;
    return data;
  }
}