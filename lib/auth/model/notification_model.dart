class NotificationModel {
  final String id;
  final String title;
  final String body;
  final DateTime date;
  bool isSeen;
  final String featureId;
  final String type;

  NotificationModel({
    required this.id,
    required this.date,
    required this.body,
    required this.title,
    required this.isSeen,
    required this.featureId,
    required this.type,
  });
}
