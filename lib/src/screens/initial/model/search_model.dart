class SearchModel {
  final int id;
  final String date;
  final String pointFrom;
  final String pointTo;
  final String trackCode;
  final int summarySeats;
  final String ticketCode;
  final List<String> images;
  final String location;
  final List<PointSS> points;

  SearchModel({
    required this.id,
    required this.date,
    required this.pointFrom,
    required this.pointTo,
    required this.trackCode,
    required this.summarySeats,
    required this.ticketCode,
    required this.location,
    required this.points,
    required this.images,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> pointsList = json['points'];
    final List<PointSS> points =
        pointsList.map((pointsList) => PointSS.fromJson(pointsList)).toList();

    return SearchModel(
      id: json['id'],
      date: json['date'],
      pointFrom: json['point_from'],
      pointTo: json['point_to'],
      trackCode: json['track_code'],
      summarySeats: json['summary_seats'],
      ticketCode: json['ticket_code'],
      images: List<String>.from(json['images']),
      location: json['location'] ?? '',
      points: points,
    );
  }
}

class PointSS {
  final String point;
  final int isCurrent;
  final String date;

  PointSS({
    required this.point,
    required this.isCurrent,
    required this.date,
  });

  factory PointSS.fromJson(Map<String, dynamic> json) {
    return PointSS(
      point: json['point'] ?? '',
      isCurrent: json['is_current'] ?? 0,
      date: json['date'] ?? '',
    );
  }
}
