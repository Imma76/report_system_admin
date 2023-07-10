import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:report_system_admin/src/collections/collections.dart';
import 'package:report_system_admin/src/model/report_model.dart';

class HomeController extends ChangeNotifier{
  bool loading=false;

  Stream<QuerySnapshot> reportStream(){
    return Collections.reportCollection.snapshots();
  }
  bool load = false;
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();

bool loadNotif= false;
  Future updateReportStatus(Reports reports)async{
    load = true;
    notifyListeners();
    await Collections.reportCollection.doc(reports.reportId).update(reports.toJson());
    load = false;
    notifyListeners();
  }
  Future  pushNotification({ String? fcmToken}) async {
    loadNotif= true;
    notifyListeners();
    print('sent notification..........${fcmToken}');
    try {
      // ignore: unused_local_variable
      http.Response response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
          //'key=AAAA72JGi3Y:APA91bHpPjkk7Ky3z9fRx5DsBlH2psHfZAi8IV-J2kPTg7sNju40jlI_k3P2eXIMhnP3rT6jvyvGEzVUlX5Tx6gyuIqxprRbskjGj6P0I10EJoCUpv4B6P2S_68RbzG_Zzv9fl1yP3Pl'
          'key=AAAAaT_C7rI:APA91bGHy2VkUfzkqp7gotcvg6CggRCiw25kQZa80K3nCldKBcHdBqIgEPaQWYmhOgr9ES9rcRGbqXuQdPA6XK4cZaUaEC80QbHAQtCN9qJ5WDLUu21XmtNUaOMc9-my1FeAHgbKI78l',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'title': title.text.trim(),
              'body':
              message.text.trim(),
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            'to':fcmToken,
          },
        ),
      );
      loadNotif= false;
      notifyListeners();
      print(response.body);
    } catch (e) {
      loadNotif= false;
      notifyListeners();
      // ignore: avoid_print
      print("error push notification");
    }
  }



}