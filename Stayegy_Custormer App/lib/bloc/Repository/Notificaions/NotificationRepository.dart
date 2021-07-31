import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stayegy/bloc/Repository/Notificaions/Notification.dart';
import 'package:stayegy/constants/ConstantLists.dart';

class NotificationRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List> getNotifications() async {
    final docRef = await db.collection("notifications").where("receiverId", isEqualTo: userDetailsGlobal.uid).limit(15).get();

    List notificationsList = [];

    print(docRef.docs.length);
    for (int i = 0; i < docRef.docs.length; i++) {
      notificationsList.add(NotificationDetails.fromMap(docRef.docs[i].data()));
    }

    return notificationsList;
  }
}
