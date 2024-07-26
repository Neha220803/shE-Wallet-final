// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample/Utils/constants.dart';
import 'package:sample/Widgets/custom_text.dart';

class CommunityData {
  final String communityName;
  final String leaderName;
  final DateTime startDate;

  CommunityData({
    required this.communityName,
    required this.leaderName,
    required this.startDate,
  });

  factory CommunityData.fromMap(Map<String, dynamic> map) {
    return CommunityData(
      communityName: map['com_name'] ?? '',
      leaderName: map['lead_name'] ?? '',
      startDate: (map['start_date'] as Timestamp).toDate(),
    );
  }
}

class Invitations extends StatefulWidget {
  const Invitations({Key? key}) : super(key: key);

  @override
  State<Invitations> createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations> {
  final CollectionReference _communityInvitationCollection =
      FirebaseFirestore.instance.collection('community_invitations');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invitations",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: secondaryColor,
        foregroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder(
            stream: _communityInvitationCollection.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length ?? 0,
                  itemBuilder: (context, index) {
                    var invitationData = snapshot.data?.docs[index].data()
                        as Map<String, dynamic>;
                    var invitation = CommunityData.fromMap(invitationData);
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Card(
                          color: white,
                          elevation: 4,
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 23,
                                backgroundColor: secondaryColor,
                                child: CustomText(
                                  value:
                                      invitation.communityName.substring(0, 1),
                                  fontWeight: FontWeight.bold,
                                  size: 20.0,
                                  color: primaryColor,
                                )),
                            title: CustomText(
                              value: invitation.communityName,
                              fontWeight: FontWeight.w700,
                              size: 14.0,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: CustomText(
                                      value:
                                          "STARTS ON ${DateFormat('dd-MM-yyyy').format(invitation.startDate)}",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      size: 10.0,
                                    )),
                                const SizedBox(height: 5),
                                CustomText(
                                  value:
                                      "Leader's Name: ${invitation.leaderName}",
                                  color: const Color(0xFF898989),
                                  fontWeight: FontWeight.w700,
                                  size: 9.0, // Adjusted font size
                                ),
                                // Text(
                                //   "Leader's Name: ${invitation.leaderName}",
                                //   style: const TextStyle(
                                //     color: Color(0xFF898989),
                                //     fontWeight: FontWeight.w700,
                                //     fontSize: 9.0, // Adjusted font size
                                //   ),
                                // ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: 35.0, // Adjusted icon size
                                    color: green,
                                  ),
                                  onPressed: () {
                                    // Handle accept or confirm action
                                    print('Accepted');
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.cancel,
                                    size: 35.0, // Adjusted icon size
                                    color: red,
                                  ),
                                  onPressed: () {
                                    // Handle delete action
                                    print('Deleted');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
