class EventModal {
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String guide;
  final Duration duration;
  final String location;
  final bool inCampus;

  EventModal({
    required this.description,
    required this.duration,
    required this.endDate,
    required this.guide,
    required this.startDate,
    required this.title,
    required this.location,
    required this.inCampus,
  });
}
