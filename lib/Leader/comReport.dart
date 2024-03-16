// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sample/BottomNavBar/notification.dart';
import 'package:sample/BottomNavBar/repayLoan.dart';
import 'package:sample/BottomNavBar/transaction.dart';
import 'package:sample/SideNavBar/chat.dart';
import 'package:sample/BottomNavBar/loanReqForm.dart';

class CommunityData {
  final String communityName;
  final String startDate;
  final String leaderName;

  CommunityData({
    required this.communityName,
    required this.startDate,
    required this.leaderName,
  });

  // Add this constructor
  factory CommunityData.fromMap(Map<String, dynamic> map) {
    return CommunityData(
      communityName: map['communityName'] ?? '',
      startDate: map['startDate'] ?? '',
      leaderName: map['leaderName'] ?? '',
    );
  }
}

class ComRep extends StatefulWidget {
  const ComRep({super.key});

  @override
  State<ComRep> createState() => _ComRepState();
}

class _ComRepState extends State<ComRep> {
  Map<String, double> dataMap = {
    "Bliss Community": 150,
    "Nirvana Comm": 60,
    "Femunity Grp": 70,
  };
  final CollectionReference _communityInvitationCollection =
      FirebaseFirestore.instance.collection('community_transaction');

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('transactions')
        .snapshots()
        .listen((event) {
      print('Snapshot: $event');
      // Handle the changes, for example, update the dataMap
      updateDataMap();
    }); // Fetch data when the widget is initialized
  }

  void updateDataMap() async {
    var collection = FirebaseFirestore.instance.collection('transactions');
    var querySnapshot =
        await collection.where('from_user', isEqualTo: 'Aanya Singh').get();
    double sum_per = querySnapshot.docs
        .map((doc) => doc['amount'] as int)
        .fold(0, (prev, amount) => prev + amount);

    // Update the dataMap and trigger a rebuild
    setState(() {
      dataMap = {
        "Bliss Community": sum_per,
        "Nirvana Comm": 60,
        "Femunity Grp": 70,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Community Dashboard",
          style: TextStyle(
            color: Color(0xFF002D56),
            fontSize: 23,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        backgroundColor: Color(0xFFFFD9D9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: 329,
              height: 75,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 131,
                      height: 75,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 131,
                              height: 75,
                              decoration: ShapeDecoration(
                                color: Color(0xFF002D56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20.03,
                            top: 8,
                            child: Text(
                              'Maximum Loan\nAmount',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 27,
                            top: 43,
                            child: SizedBox(
                              width: 79,
                              height: 22,
                              child: Text(
                                '₹ 50,000',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 171,
                    top: 0,
                    child: Container(
                      width: 131,
                      height: 75,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 131,
                              height: 75,
                              decoration: ShapeDecoration(
                                color: Color(0xFF002D56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20.03,
                            top: 8,
                            child: Text(
                              'Maximum Loan\nrequest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 27,
                            top: 43,
                            child: SizedBox(
                              width: 79,
                              height: 22,
                              child: Text(
                                '12',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 343,
                    top: 0,
                    child: Container(
                      width: 131,
                      height: 75,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 131,
                              height: 75,
                              decoration: ShapeDecoration(
                                color: Color(0xFF002D56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 19.03,
                            top: 8,
                            child: Text(
                              'No. of approved\nloans',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 27,
                            top: 43,
                            child: SizedBox(
                              width: 79,
                              height: 22,
                              child: Text(
                                '3',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 510,
                    top: 0,
                    child: Container(
                      width: 170,
                      height: 75,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 170,
                              height: 75,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 131,
                                      height: 75,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF002D56),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 14.03,
                            top: 7.99,
                            child: Text(
                              'Min com balance \nfor loan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 27,
                            top: 43,
                            child: SizedBox(
                              width: 79,
                              height: 22,
                              child: Text(
                                '₹ 90,000',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              color: Color(0xFFFFD9D9),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true, // Change to true
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 314.22,
              height: 212.82,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 23,
                    child: Container(
                      width: 314.22,
                      height: 189.82,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 314.22,
                              height: 189.82,
                              decoration: ShapeDecoration(
                                color: Color(0xFF002D56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.82),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15.66,
                            top: 17.51,
                            child: Container(
                              width: 284.73,
                              height: 42.39,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.82),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 12.90,
                            top: 71.87,
                            child: Container(
                              width: 284.73,
                              height: 42.39,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.82),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15.66,
                            top: 128.08,
                            child: Container(
                              width: 284.73,
                              height: 45.15,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.82),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 22.12,
                            top: 20.27,
                            child: Container(
                              width: 36.86,
                              height: 36.86,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/u5.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(92.15),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 22.12,
                            top: 74.64,
                            child: Container(
                              width: 36.86,
                              height: 36.86,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/u7.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(92.15),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 23.04,
                            top: 132.69,
                            child: Container(
                              width: 36.86,
                              height: 36.86,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/u8.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(92.15),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 68.20,
                            top: 31.33,
                            child: Text(
                              'Pushpa - ₹ 500',
                              style: TextStyle(
                                color: Color(0xFFFF6A6A),
                                fontSize: 12.14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 70.04,
                            top: 143.75,
                            child: Text(
                              'Maaya - ₹ 300',
                              style: TextStyle(
                                color: Color(0xFFFF6A6A),
                                fontSize: 12.14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 70.04,
                            top: 86.62,
                            child: Text(
                              'Bavidra - ₹ 1000',
                              style: TextStyle(
                                color: Color(0xFFFF6A6A),
                                fontSize: 12.14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0.01,
                    top: 0,
                    child: Text(
                      'Community Loan Requests',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 314,
              height: 222.76,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 25.21,
                    child: Container(
                      width: 314,
                      height: 197.56,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 122.63,
                            top: 175.56,
                            child: Text(
                              'Sign Out',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.18,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 314,
                              height: 189.69,
                              decoration: ShapeDecoration(
                                color: Color(0xFF002D56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.81),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 12.89,
                            top: 17.50,
                            child: Container(
                              width: 284.53,
                              height: 42.36,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.81),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10.13,
                            top: 71.82,
                            child: Container(
                              width: 284.53,
                              height: 42.36,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.81),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 12.89,
                            top: 127.99,
                            child: Container(
                              width: 284.53,
                              height: 45.12,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.81),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 21.18,
                            top: 20.26,
                            child: Container(
                              width: 37.14,
                              height: 36.83,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/u1.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(184.16),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 21.18,
                            top: 74.59,
                            child: Container(
                              width: 36.83,
                              height: 36.83,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/u0.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(184.16),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 22.10,
                            top: 130.76,
                            child: Container(
                              width: 34.05,
                              height: 36.83,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assetName"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(184.16),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 66.31,
                            top: 141.81,
                            child: Text(
                              'Maria Margret - ₹ 30,000',
                              style: TextStyle(
                                color: Color(0xFFFF6A6A),
                                fontSize: 12.13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 68.15,
                            top: 86.56,
                            child: Text(
                              'Vinolini - ₹ 20,000',
                              style: TextStyle(
                                color: Color(0xFFFF6A6A),
                                fontSize: 12.13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 66.31,
                            top: 32.23,
                            child: Text(
                              'Deepha - ₹ 10,000',
                              style: TextStyle(
                                color: Color(0xFFFF6A6A),
                                fontSize: 12.13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 3.01,
                    top: 5,
                    child: Text(
                      'Bank Loan Requests',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 303,
              height: 189,
              child: Stack(
                children: [
                  Positioned(
                    left: 3,
                    top: 0,
                    child: Text(
                      'Loan request for approval',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 25,
                    child: Container(
                      width: 303,
                      height: 74,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 9.40,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 70,
                            top: 19,
                            child: Text(
                              'Sara Ibrahim',
                              style: TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 227,
                            top: 41,
                            child: Container(
                              width: 63,
                              height: 20,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 63,
                                      height: 20,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF002D56),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 18,
                                    top: 5.33,
                                    child: Text(
                                      'PENDING',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 6,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 64,
                            top: 40,
                            child: Text(
                              'Requested on 20/02/2024',
                              style: TextStyle(
                                color: Color(0xFF898989),
                                fontSize: 7.84,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 11,
                            top: 16,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/u3.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 236,
                            top: 18,
                            child: Text(
                              '₹ 7,000',
                              style: TextStyle(
                                color: Color(0xFF91CA9B),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: 0.12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 115,
                    child: Container(
                      width: 303,
                      height: 74,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 9.40,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 64,
                            top: 15,
                            child: Text(
                              'Sabura Aswathi',
                              style: TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 227,
                            top: 41,
                            child: Container(
                              width: 63,
                              height: 20,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 63,
                                      height: 20,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF002D56),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 18,
                                    top: 5.33,
                                    child: Text(
                                      'APPROVE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 6,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 64,
                            top: 40,
                            child: Text(
                              'Requested on 16/02/2024',
                              style: TextStyle(
                                color: Color(0xFF898989),
                                fontSize: 7.84,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 235,
                            top: 18,
                            child: Text(
                              '₹ 4,500',
                              style: TextStyle(
                                color: Color(0xFF91CA9B),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: 0.12,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 12,
                            top: 15,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/u5.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 304,
              height: 159.71,
              child: Stack(
                children: [
                  Positioned(
                    left: 6,
                    top: 0,
                    child: Text(
                      'Loan Analystics',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 25,
                    child: Container(
                      width: 304,
                      height: 134.71,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 304,
                              height: 134.71,
                              decoration: ShapeDecoration(
                                color: Color(0xFF002D56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.65),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 3.64,
                                    offset: Offset(0, 3.64),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 25.48,
                            top: 33.68,
                            child: Container(
                              width: 85.56,
                              height: 85.56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/d2.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 19.13,
                            top: 10.92,
                            child: Text(
                              'Total Loan Request',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.99,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 138,
                            top: 47,
                            child: Container(
                              width: 14.56,
                              height: 14.56,
                              decoration:
                                  BoxDecoration(color: Color(0xFF26B99A)),
                            ),
                          ),
                          Positioned(
                            left: 138,
                            top: 89.78,
                            child: Container(
                              width: 14.56,
                              height: 14.56,
                              decoration:
                                  BoxDecoration(color: Color(0xFF2980BA)),
                            ),
                          ),
                          Positioned(
                            left: 138,
                            top: 68.84,
                            child: Container(
                              width: 14.56,
                              height: 14.56,
                              decoration:
                                  BoxDecoration(color: Color(0xFFF0C419)),
                            ),
                          ),
                          Positioned(
                            left: 158.02,
                            top: 47,
                            child: SizedBox(
                              width: 130.16,
                              child: Text(
                                'OPEN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.39,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 158.02,
                            top: 69.75,
                            child: SizedBox(
                              width: 137.44,
                              child: Text(
                                'APPROVED',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.39,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 158.02,
                            top: 92.51,
                            child: SizedBox(
                              width: 121.05,
                              child: Text(
                                'PENDING',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.39,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(color: Color(0xFFFFD9D9)),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      fixedSize: const Size(330, 40),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LoanRequestDialog();
                        },
                      );
                    },
                    child: Text(
                      "Request Bank Loan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      fixedSize: const Size(330, 40),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LoanRequestDialog();
                        },
                      );
                    },
                    child: Text(
                      "Request Community Loan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 291,
              height: 184,
              child: Stack(
                children: [
                  Positioned(
                    left: 5,
                    top: 0,
                    child: Text(
                      'Approved Loans',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 30,
                    child: Container(
                      width: 291,
                      height: 154,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 291,
                              height: 40,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 49.62,
                                    top: 22,
                                    child: SizedBox(
                                      width: 96.13,
                                      child: Opacity(
                                        opacity: 0.40,
                                        child: Text(
                                          'Feb 13',
                                          style: TextStyle(
                                            color: Color(0xFF1A1A1A),
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0.12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 49.62,
                                    top: 0,
                                    child: SizedBox(
                                      width: 69.26,
                                      child: Text(
                                        'Hiba Saleh',
                                        style: TextStyle(
                                          color: Color(0xFF1A1A1A),
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 243,
                                    top: 11,
                                    child: Text(
                                      '₹ 1500',
                                      style: TextStyle(
                                        color: Color(0xFF3E3E3F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: 0.12,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 41.35,
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/u1.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 1,
                            top: 57,
                            child: Container(
                              width: 290,
                              height: 40,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 48,
                                    top: 22,
                                    child: Opacity(
                                      opacity: 0.40,
                                      child: Text(
                                        'Jan 22',
                                        style: TextStyle(
                                          color: Color(0xFF1A1A1A),
                                          fontSize: 12,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 240,
                                    top: 11,
                                    child: Text(
                                      '₹ 5000',
                                      style: TextStyle(
                                        color: Color(0xFF3E3E3F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: 0.12,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 48,
                                    top: 0,
                                    child: Text(
                                      'Sahar Fawzi',
                                      style: TextStyle(
                                        color: Color(0xFF1A1A1A),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 0.11,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/u2.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 1,
                            top: 114,
                            child: Container(
                              width: 290,
                              height: 40,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 48,
                                    top: 22,
                                    child: Opacity(
                                      opacity: 0.40,
                                      child: Text(
                                        'Jan 03',
                                        style: TextStyle(
                                          color: Color(0xFF1A1A1A),
                                          fontSize: 12,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 48,
                                    top: 0,
                                    child: Text(
                                      'Nisreen Ismail',
                                      style: TextStyle(
                                        color: Color(0xFF1A1A1A),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 0.11,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 241,
                                    top: 6,
                                    child: Text(
                                      '₹ 2500',
                                      style: TextStyle(
                                        color: Color(0xFF3E3E3F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: 0.12,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/u4.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
