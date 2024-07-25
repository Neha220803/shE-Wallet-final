import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample/Utils/constants.dart';

Future<List<Widget>> fetchCommunityData(context) async {
  List<Widget> carouselItems = [];
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('community_details').get();

  querySnapshot.docs.forEach((doc) {
    String communityName = doc['name'];
    int membersCount = doc['members_count'];
    bool isActive = doc['full'] == 0;
    Timestamp startDateTimestamp = doc['start_date'];
    DateTime startDate = startDateTimestamp.toDate();

    String formattedStartDate =
        "${startDate.day}/${startDate.month}/${startDate.year}";

    Widget communityCard = buildCommunityCard(
      context,
      communityName,
      membersCount,
      formattedStartDate,
      isActive,
    );

    carouselItems.add(communityCard);
  });

  return carouselItems;
}

Widget buildCommunityCard(
  BuildContext context,
  String communityName,
  int membersCount,
  String formattedStartDate,
  bool isActive,
) {
  return Card(
    color: isActive ? const Color.fromARGB(255, 255, 130, 138) : Colors.red,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              communityName,
              style: TextStyle(
                fontSize: (MediaQuery.of(context).size.width) / 13.7,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Members: $membersCount',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Starts on: $formattedStartDate',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            isActive
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor,
                    ),
                    child: const Text(
                      'ACTIVE',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    ),
  );
}
