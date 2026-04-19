class Training {
  final String id;
  final String day;
  final String time;
  final String place;
  final String type;
  final String team;

  Training({
    required this.id,
    required this.day,
    required this.time,
    required this.place,
    required this.type,
    required this.team,
  });

  factory Training.fromJson(Map<String, dynamic> json) {
    return Training(
      id: json['id'],
      day: json['day'],
      time: json['time'],
      place: json['place'],
      type: json['type'],
      team: json['team'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'time': time,
      'place': place,
      'type': type,
      'team': team,
    };
  }
}
