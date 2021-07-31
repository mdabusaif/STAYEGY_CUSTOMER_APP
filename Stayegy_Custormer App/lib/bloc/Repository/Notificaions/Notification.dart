import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationDetails {
  String receiverId;
  String senderId;
  String notificationType;
  String hotel;
  Timestamp time;
  bool seen;

  NotificationDetails({
    this.hotel,
    this.notificationType,
    this.receiverId,
    this.senderId,
    this.time,
    this.seen,
  });

  Map<String, dynamic> toJason() => {
        'hotel': hotel,
        'notificationType': notificationType,
        'receiverId': receiverId,
        'senderId': senderId,
        'time': time,
        'seen': seen,
      };

  NotificationDetails.fromMap(Map<String, dynamic> notification) {
    hotel = notification["hotel"];
    receiverId = notification["receiverId"];
    senderId = notification["senderId"];
    time = notification["time"];
    seen = notification["seen"];
    notificationType = notification["notificationType"];
  }
}
