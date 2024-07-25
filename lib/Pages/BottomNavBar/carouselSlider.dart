import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselCommunities extends StatefulWidget {
  @override
  _CarouselCommunitiesState createState() => _CarouselCommunitiesState();
}
class _CarouselCommunitiesState extends State<CarouselCommunities> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: fetchCommunityData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Widget>? carouselItems = snapshot.data;
            return Column(
              children: <Widget>[
                CarouselSlider(
                  items: carouselItems!,
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval:
                        Duration(seconds: 3), // Duration for each slide
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 2,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<List<Widget>> fetchCommunityData() async {
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
    String communityName,
    int membersCount,
    String formattedStartDate,
    bool isActive,
  ) {
    return Card(
      color: isActive ? Color.fromARGB(255, 255, 130, 138) : Colors.red,
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
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Starts on: $formattedStartDate',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isActive
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 17, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF002D56),
                      ),
                      child: Text(
                        'ACTIVE',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
