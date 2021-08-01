import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stayegy/bloc/Repository/Notificaions/Notification.dart';
import 'package:stayegy/constants/ConstantLists.dart';

class NotificationRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future placeNotification(NotificationDetails notification) async {
    await db.collection("notifications").doc().set(notification.toJason());
  }

  Future<List> getNotifications() async {
    final docRef = await db.collection("notifications").where("receiverId", isEqualTo: userDetailsGlobal.uid).orderBy("time", descending: true).limit(10).get();

    List notificationsList = [];

    print(docRef.docs.length);
    for (int i = 0; i < docRef.docs.length; i++) {
      notificationsList.add(NotificationDetails.fromMap(docRef.docs[i].data()));
      notificationsList[i].nId = docRef.docs[i].id;
    }

    return notificationsList;
  }

  Future deleteSeenNotifications(List notifications) async {
    for (int i = 0; i < notifications.length; i++) {
      if (notifications[i].seen == false) {
        await db.collection("notifications").doc(notifications[i].nId).update({'seen': true});
      }
    }
  }
}
