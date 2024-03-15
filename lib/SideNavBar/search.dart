import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class searComm extends StatefulWidget {
  const searComm({super.key});

  @override
  State<searComm> createState() => _searCommState();
}

class _searCommState extends State<searComm> {
  
  final CollectionReference _users = FirebaseFirestore.instance.collection('community_location');
  double _lat=12.9737143;
  double _lon=80.2182974;

  double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
  const double earthRadius = 6371; // Radius of the Earth in kilometers

  // Convert latitude and longitude from degrees to radians
  lat1 = _degreesToRadians(lat1);
  lon1 = _degreesToRadians(lon1);
  lat2 = _degreesToRadians(lat2);
  lon2 = _degreesToRadians(lon2);

  // Calculate the change in coordinates
  double dlat = lat2 - lat1;
  double dlon = lon2 - lon1;

  // Haversine formula
  double a = sin(dlat / 2) * sin(dlat / 2) +
      cos(lat1) * cos(lat2) * sin(dlon / 2) * sin(dlon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  // Calculate the distance
  double distance = earthRadius * c;
  print("Distance: $distance");
  return distance;
}

double _degreesToRadians(double degrees) {
  return degrees * (pi / 180.0);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Communities Near You",style: TextStyle(color: Color(0xFF002D56))),
        backgroundColor:  Color(0xFFFFD9D9),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          
         SizedBox(height: 16,),
         Expanded(child: StreamBuilder(stream: _users.snapshots(), builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          List<DocumentSnapshot> users = snapshot.data!.docs;
          print("length: ${users.length}");
          return ListView.builder(itemCount:users.length, itemBuilder: (context, index){
            print("distance: ${haversineDistance(_lat, _lon, users[index]['lat'], users[index]['lng'])}");
            if(haversineDistance(_lat, _lon, users[index]['lat'], users[index]['lng'])<=2){
            var user = users[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(user['community_name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
                subtitle: Text(user['location'],style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: IconButton(onPressed:(){}, icon: Icon(Icons.add),),
            
              )
            );
          }
          else{
            return Container();
          
          }
          }
          );
         }
         )
         )
        ],
      ),
    ),
    );
  }
  }