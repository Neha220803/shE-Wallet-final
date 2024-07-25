import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample/Pages/BottomNavBar/transaction.dart';

class TransactionData {
  final int? amount;
  final String? communityId;
  final Timestamp time_stamp;
  final String fromUser;

  TransactionData({
    required this.amount,
    required this.communityId,
    required this.time_stamp,
    required this.fromUser,
  });
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final CollectionReference _transactions =
      FirebaseFirestore.instance.collection('transactions');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Transaction History",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFFFD9D9),
        foregroundColor: Color(0xFF002D56),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: StreamBuilder(
                stream: _transactions
                    .where('from_user', isEqualTo: "Ananya Sign")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length ?? 0,
                      itemBuilder: (context, index) {
                        var transactionData = snapshot.data?.docs[index].data()
                            as Map<String, dynamic>;
                        var transaction = TransactionData(
                          amount: transactionData['amount'],
                          communityId: transactionData['communityId'],
                          time_stamp: transactionData['time_stamp'],
                          fromUser: transactionData['from_user'],
                        );
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
                                    transaction.fromUser.substring(0, 1),
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
                                      transaction.fromUser,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5),
                                    Text(
                                      '${formattedTimestamp(transaction.time_stamp.toDate())}',
                                      style: TextStyle(
                                        color: Color(0xFF898989),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  '₹${transaction.amount}',
                                  style: TextStyle(
                                    color: Color(0xFF898989),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )),
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
      ),
    );
  }
}
