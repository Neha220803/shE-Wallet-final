// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationData {
  // final String communityId;
  final String textMessage;
  final String textTitle;
  final DateTime timeStamp;
  final String communityName;

  NotificationData({
    // required this.communityId,
    required this.textMessage,
    required this.textTitle,
    required this.timeStamp,
    required this.communityName,
  });

  factory NotificationData.fromMap(Map<String, dynamic> map) {
    return NotificationData(
      // communityId: map['community_id'] ?? '',
      textMessage: map['mssg'] ?? '',
      timeStamp: (map['time_stamp'] as Timestamp).toDate(),
      communityName: map['com_name'] ?? '',
      textTitle: map['mssg_title'] ?? '',
    );
  }
}

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  final CollectionReference _communityNotificationsCollection =
      FirebaseFirestore.instance.collection('community_notification');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: 450,
          // height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFFFD9D9),
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF002D56),
                width: 2.0,
              ),
            ),
          ),
          child: Text(
            'Community Notifications',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF002D56),
              fontSize: 23,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: StreamBuilder(
              stream: _communityNotificationsCollection.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length ?? 0,
                    itemBuilder: (context, index) {
                      var notificationData = snapshot.data?.docs[index].data()
                          as Map<String, dynamic>;
                      var notification =
                          NotificationData.fromMap(notificationData);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Card(
                          elevation: 4,
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xFFFFD9D9),
                              child: Text(
                                notification.communityName.substring(0, 1),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Color(0xFF002D56)),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification.communityName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  notification
                                      .textMessage, // Displaying textMessage in the title
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Time Stamp: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(notification.timeStamp)}',
                                  style: TextStyle(
                                    color: Color(0xFF898989),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
