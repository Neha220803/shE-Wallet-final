import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'push_noti.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SendNotif extends StatefulWidget {
  @override
  _SendNotifState createState() => _SendNotifState();
}

class _SendNotifState extends State<SendNotif> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  FirebaseApi _firebaseApi = FirebaseApi();

  final CollectionReference _notif =
      FirebaseFirestore.instance.collection('community_notification');

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    'Send Notification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF002D56),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF002D56),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2.5,
                        color: Color(0xFF002D56),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: "Enter Notification Title",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF002D56),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2.5,
                        color: Color(0xFF002D56),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: "Enter Notification Message",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a message';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    backgroundColor: Color(0xFF002D56),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(350, 50),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await _notif.add({
                        'com_id': "BC101",
                        'com_name': "Bliss Community",
                        'mssg_title': _titleController.text,
                        'mssg': _messageController.text,
                        'time_stamp': FieldValue.serverTimestamp(),
                      });

                      _firebaseApi.sendPushNotification(
                        _titleController.text,
                        _messageController.text,
                      );

                      Navigator.pop(context);
                    }
                  },
                  child: Text('SEND'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notification',
      description: "This channel is used for important notifications",
      importance: Importance.defaultImportance);
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("firebase Token: $fcmToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
                _androidChannel.id, _androidChannel.name,
                channelDescription: _androidChannel.description,
                icon: '@drawwable/ic_launcher'),
          ),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future<void> sendPushNotification(String title, String body) async {
    final fcmToken = await _firebaseMessaging.getToken();
    print("firebase Token: $fcmToken");

    await _firebaseMessaging.subscribeToTopic('all');
    await _firebaseMessaging.subscribeToTopic('notifications');
    await _firebaseMessaging.subscribeToTopic('individual_$fcmToken');
    await _firebaseMessaging.subscribeToTopic('custom');
    await _firebaseMessaging.subscribeToTopic('community_notifications');
    await _firebaseMessaging.subscribeToTopic('user_$fcmToken');
    await _firebaseMessaging.subscribeToTopic('reminder_notifications');

    final message = RemoteMessage(
      data: {
        'title': title,
        'body': body,
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the message as needed
      final notification = message.notification;
      if (notification == null) return;

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawwable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });

    final notification = message.notification;
    if (notification == null) return;

    _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: '@drawwable/ic_launcher',
        ),
      ),
      payload: jsonEncode(message.toMap()),
    );
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}
