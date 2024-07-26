import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample/Functions/formatted_time.dart';
import 'package:sample/Utils/constants.dart';
import 'package:sample/Widgets/custom_text.dart';

class TransactionData {
  final int? amount;
  final String? communityId;
  final Timestamp timeStamp;
  final String fromUser;

  TransactionData({
    required this.amount,
    required this.communityId,
    required this.timeStamp,
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
        title: const CustomText(
            value: "Your Transaction History", fontWeight: FontWeight.bold),
        backgroundColor: secondaryColor,
        foregroundColor: primaryColor,
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
                          timeStamp: transactionData['time_stamp'],
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
                                    backgroundColor: secondaryColor,
                                    child: Text(
                                      transaction.fromUser.substring(0, 1),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: primaryColor),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transaction.fromUser,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5),
                                      CustomText(
                                        value: formattedTimestamp(
                                            transaction.timeStamp.toDate()),
                                        color: const Color(0xFF898989),
                                        fontWeight: FontWeight.w700,
                                        size: 12.0,
                                      ),
                                    ],
                                  ),
                                  trailing: CustomText(
                                    value: '₹${transaction.amount}',
                                    color: const Color(0xFF898989),
                                    fontWeight: FontWeight.w700,
                                    size: 16.0,
                                  ))),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(child: CircularProgressIndicator());
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
