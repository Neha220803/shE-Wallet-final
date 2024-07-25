import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample/Functions/formatted_time.dart';
import 'package:sample/Utils/constants.dart';

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

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final CollectionReference _transactions =
      FirebaseFirestore.instance.collection('transactions');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: 450,
            height: 65,
            decoration: const BoxDecoration(
              color: secondaryColor,
              border: Border(
                bottom: BorderSide(
                  color: primaryColor,
                  width: 2.0,
                ),
              ),
            ),
            child: const Text(
              'Community Transactions',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor,
                fontSize: 23,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 150,
              color: Colors.green,
              child: Stack(
                children: [
                  const Positioned(
                    left: 14,
                    top: 12,
                    child: SizedBox(
                      width: 164,
                      height: 79,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Community Balance\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: '₹',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: ' 80,000\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 14,
                    top: 104,
                    child: Text(
                      'Savings Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 272,
                    top: 6,
                    child: SizedBox(
                      width: 35,
                      height: 15,
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 12,
                            top: 1,
                            child: Text(
                              'SBI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: -2,
                            top: 0,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/SBI.png"),
                                  fit: BoxFit.fill,
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
          const SizedBox(height: 20),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: StreamBuilder(
                stream: _transactions.snapshots(),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 5),
                                    Text(
                                      formattedTimestamp(
                                          transaction.time_stamp.toDate()),
                                      style: const TextStyle(
                                        color: Color(0xFF898989),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  '₹${transaction.amount}',
                                  style: const TextStyle(
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
