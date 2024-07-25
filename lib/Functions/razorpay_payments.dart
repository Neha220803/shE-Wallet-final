// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void handlePaymentErrorResponse(
    PaymentFailureResponse response, BuildContext context) {
  /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
  showAlertDialog(context, "Payment Failed",
      "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
}

Future<void> handlePaymentSuccessResponse(
    PaymentSuccessResponse response, context) async {
  /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
  print(response.data.toString());
  showAlertDialog(
      context, "Payment Successful", "Payment ID: ${response.paymentId}");
}

void handleExternalWalletSelected(ExternalWalletResponse response, context) {
  showAlertDialog(
      context, "External Wallet Selected", "${response.walletName}");
}

void showAlertDialog(BuildContext context, String title, String Message) {
  Widget continueButton = ElevatedButton(
    child: const Text("Continue"),
    onPressed: () {},
  );
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(Message),
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
