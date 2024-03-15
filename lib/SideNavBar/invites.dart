import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


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
        title:
            Text("Invitations", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 255, 217, 217),
        foregroundColor: Color(0xFF002D56),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder(
            stream: _communityInvitationCollection.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length ?? 0,
                  itemBuilder: (context, index) {
                    var invitationData = snapshot.data?.docs[index].data()
                        as Map<String, dynamic>;
                    var invitation = CommunityData.fromMap(invitationData);

                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Card(
                          color: Colors.white,
                          elevation: 4,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 23,
                              backgroundColor: Color(0xFFFFD9D9),
                              child: Text(
                                invitation.communityName.substring(0, 1),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0xFF002D56),
                                ),
                              ),
                            ),
                            title: Text(
                              invitation.communityName,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0, // Adjusted font size
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF002D56),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text(
                                    "STARTS ON ${DateFormat('dd-MM-yyyy').format(invitation.startDate)}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.0, // Adjusted font size
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Leader's Name: ${invitation.leaderName}",
                                  style: TextStyle(
                                    color: Color(0xFF898989),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 9.0, // Adjusted font size
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: 35.0, // Adjusted icon size
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    // Handle accept or confirm action
                                    print('Accepted');
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 35.0, // Adjusted icon size
                                    color: Colors.red,
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
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
