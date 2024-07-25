import 'package:flutter/material.dart';
import 'package:sample/Utils/constants.dart';

class LoanProgress extends StatefulWidget {
  const LoanProgress({super.key});

  @override
  State<LoanProgress> createState() => _LoanProgressState();
}

class _LoanProgressState extends State<LoanProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leader Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: secondaryColor,
        foregroundColor: primaryColor,
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: Text('Bank Loan Request'),
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Community Loan Request'),
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Community Loan Repayment Progress'),
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
