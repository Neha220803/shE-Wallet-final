import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sample/Pages/BottomNavBar/notification.dart';
import 'package:sample/Pages/BottomNavBar/repayLoan.dart';
import 'package:sample/Pages/BottomNavBar/transaction.dart';
import 'package:sample/Pages/SideNavBar/chat.dart';
import 'package:sample/Pages/BottomNavBar/loanReqForm.dart';
import 'package:sample/Pages/SideNavBar/payment.dart';

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

// ignore_for_file: prefer_const_constructors
class CommDash extends StatefulWidget {
  const CommDash({super.key});

  @override
  State<CommDash> createState() => _CommDashState();
}

class _CommDashState extends State<CommDash> {
  // Map<String, double> dataMap = {
  //   "Bliss Community": 150,
  //   "Nirvana Comm": 60,
  //   "Femunity Grp": 70,
  // };

  final CollectionReference _communityInvitationCollection =
      FirebaseFirestore.instance.collection('community_transaction');

  // final List<ValueItem> _selectedOptions = [];
  // @override
  // void initState() {
  //   super.initState();

  //   FirebaseFirestore.instance
  //       .collection('transactions')
  //       .snapshots()
  //       .listen((event) {
  //     print('Snapshot: $event');
  //     // Handle the changes, for example, update the dataMap
  //     updateDataMap();
  //   }); // Fetch data when the widget is initialized
  // }

  // void updateDataMap() async {
  //   var collection = FirebaseFirestore.instance.collection('transactions');
  //   var querySnapshot =
  //       await collection.where('from_user', isEqualTo: 'Aanya Singh').get();
  //   double sum_per = querySnapshot.docs
  //       .map((doc) => doc['amount'] as int)
  //       .fold(0, (prev, amount) => prev + amount);

  //   // Update the dataMap and trigger a rebuild
  //   setState(() {
  //     dataMap = {
  //       "Bliss Community": sum_per,
  //       "Nirvana Comm": 60,
  //       "Femunity Grp": 70,
  //     };
  //   });
  // }
  Future<List<String>> fetchComs(String uid) async {
    // Reference to the users collection
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Get the document snapshot for the user with the provided UID
    DocumentSnapshot userSnapshot = await usersCollection.doc(uid).get();

    // Extract the 'coms' array from the document data
    List<String> coms = List<String>.from(userSnapshot.get('coms') ?? []);

    return coms;
  }

// Example usage:
  void getUserComs() async {
    String uid = '0Cv2DhNx4mq52bE3UdzH'; // Replace with the actual UID
    List<String> coms = await fetchComs(uid);
    print('coms: $coms');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              'Community Dashboard',
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
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Color(0xFF002D56), width: 2.5),
              // Example border color
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: 'Bliss Community', // Example initial value
                onChanged: null,
                items: <String>['Bliss Community', 'Two', 'Three', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 325.51,
            height: 143,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 158,
                    height: 67,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 158,
                            height: 67,
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
                          left: 21.03,
                          top: 5,
                          child: SizedBox(
                            width: 115.90,
                            child: Text(
                              'Total Months \nContribution',
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
                        ),
                        Positioned(
                          left: 67,
                          top: 35,
                          child: SizedBox(
                            width: 38,
                            child: Text(
                              '40',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.84,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 76,
                  child: Container(
                    width: 158.51,
                    height: 67,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 158,
                            height: 67,
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
                          left: 21.01,
                          top: 9,
                          child: SizedBox(
                            width: 115.90,
                            child: Text(
                              'Interest Gained ',
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
                        ),
                        Positioned(
                          left: 31.51,
                          top: 29,
                          child: SizedBox(
                            width: 127,
                            child: Text(
                              '₹ 15,000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
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
                  left: 168.51,
                  top: 0,
                  child: Container(
                    width: 157,
                    height: 67,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 157,
                            height: 67,
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
                          left: 39.54,
                          top: 6,
                          child: Text(
                            'Total Amount \nContributed',
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
                          left: 26.51,
                          top: 36,
                          child: SizedBox(
                            width: 111,
                            child: Text(
                              '₹ 1,80,000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
                  left: 169,
                  top: 76,
                  child: Container(
                    width: 156,
                    height: 67,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 156,
                            height: 67,
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
                          left: 31.53,
                          top: 9,
                          child: Text(
                            'Monthly Deposit',
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
                          left: 39.51,
                          top: 28,
                          child: SizedBox(
                            width: 98,
                            child: Text(
                              '₹ 4500',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
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
          SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width - 50, 80),

                //width: MediaQuery.of(context).size.width - 50,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentPage()));
              },
              child: Text(
                'Pay next Monthly Deposit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.32,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(),
          SizedBox(height: 15),
          Container(
            width: 355,
            height: 97,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Text(
                    'Community Loan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0.07,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 30,
                  child: Container(
                    width: 355,
                    height: 67,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 158,
                            height: 67,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 158,
                                    height: 67,
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
                                  left: 27,
                                  top: 31,
                                  child: SizedBox(
                                    width: 113,
                                    height: 28,
                                    child: Text(
                                      '₹ 10,000',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: 0.12,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 21.02,
                                  top: 4,
                                  child: SizedBox(
                                    width: 115.90,
                                    child: Text(
                                      'Amount',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 197,
                          top: 0,
                          child: Container(
                            width: 158,
                            height: 67,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 158,
                                    height: 67,
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
                                  left: 43,
                                  top: 34,
                                  child: SizedBox(
                                    width: 82,
                                    height: 28,
                                    child: Text(
                                      '₹ 100',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: 0.12,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 12.02,
                                  top: 9,
                                  child: SizedBox(
                                    width: 136.66,
                                    child: Text(
                                      'Interest (1%)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width - 50, 80),

                //width: MediaQuery.of(context).size.width - 50,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RepayLoan();
                  },
                );
              },
              child: Text(
                'Repay Your Loan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.32,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Divider(),
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
            height: 20,
          ),
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
                            decoration: BoxDecoration(color: Color(0xFF26B99A)),
                          ),
                        ),
                        Positioned(
                          left: 138,
                          top: 89.78,
                          child: Container(
                            width: 14.56,
                            height: 14.56,
                            decoration: BoxDecoration(color: Color(0xFF2980BA)),
                          ),
                        ),
                        Positioned(
                          left: 138,
                          top: 68.84,
                          child: Container(
                            width: 14.56,
                            height: 14.56,
                            decoration: BoxDecoration(color: Color(0xFFF0C419)),
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
                                        borderRadius: BorderRadius.circular(20),
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
                                        borderRadius: BorderRadius.circular(20),
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
                                        borderRadius: BorderRadius.circular(20),
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
    );
  }
}

class User {
  final String name;
  final int id;

  User({required this.name, required this.id});

  @override
  String toString() {
    return 'User(name: $name, id: $id)';
  }
}





//  SizedBox(
//             height: 15,
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 250,
//             color: Color(0xFFFFD9D9),
//             child: PieChart(
//               dataMap: dataMap,
//               animationDuration: Duration(milliseconds: 800),
//               chartLegendSpacing: 32,
//               chartRadius: MediaQuery.of(context).size.width / 3.2,
//               initialAngleInDegree: 0,
//               chartType: ChartType.ring,
//               ringStrokeWidth: 32,
//               legendOptions: LegendOptions(
//                 showLegendsInRow: false,
//                 legendPosition: LegendPosition.right,
//                 showLegends: true,
//                 legendTextStyle: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               chartValuesOptions: ChartValuesOptions(
//                 showChartValueBackground: true,
//                 showChartValues: true,
//                 showChartValuesInPercentage: true, // Change to true
//                 showChartValuesOutside: false,
//                 decimalPlaces: 1,
//               ),
//             ),
//           ),