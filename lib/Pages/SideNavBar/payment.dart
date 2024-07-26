import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sample/Functions/razorpay_payments.dart';
import 'package:sample/Utils/constants.dart';
import 'package:sample/Widgets/custom_button.dart';
import 'package:sample/Widgets/custom_text.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // final CollectionReference _transactions =
  //     FirebaseFirestore.instance.collection('transactions');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Monthly Payment",
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: secondaryColor,
          foregroundColor: primaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            Container(
              height: 40,
              width: 350,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: primaryColor, width: 2.0),
                ),
              ),
              child: const CustomText(
                value: " Monthly Contribution - March",
                color: Color.fromARGB(255, 228, 63, 74),
                size: 21.59,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
              // Text(
              //   'Monthly Contribution - March',

              // style: TextStyle(
              //   color: Color.fromARGB(255, 228, 63, 74),
              //   fontSize: 21.59,
              //   fontFamily: 'Roboto',
              //   fontWeight: FontWeight.w700,
              //   height: 0,
              // ),
            ),
            const SizedBox(height: 60),
            const Image(
              image: AssetImage("images/payment_icon.png"),
              // Set height as needed
            ),
            const SizedBox(height: 60),
            Container(
              width: 300.39,
              height: 148.44,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(31.62),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      value: "Amount",
                      color: white,
                      size: 21.84,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 249,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF658EB3),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Center(
                        child: CustomText(
                          value: 'Rs. 100',
                          textAlign: TextAlign.center,
                          color: Colors.white,
                          size: 23,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 450,
              height: 60,
              child: Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: secondaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            value: '₹ 100',
                            color: Colors.black,
                            size: 20,
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w700,
                          ),

                          // Text(
                          //   '₹ 100',
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 20,
                          //     fontFamily: 'IBM Plex Sans',
                          //     fontWeight: FontWeight.w700,
                          //     height: 0,
                          //   ),
                          // ),
                          SizedBox(height: 8),

                          CustomText(
                            value: 'View detailed bill',
                            color: Color(0xFFFF4F5A),
                            size: 14,
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),

                      CustomButton(
                        text: 'View Payment Options',
                        color: tertiaryColor,
                        fixedSize: const Size(350, 55),
                        callback: () {
                          // Add your onPressed logic here
                          Razorpay razorpay = Razorpay();
                          var options = {
                            'key': 'rzp_test_1DP5mmOlF5G5ag',
                            'amount': 15000,
                            'name': 'Ananya Singh',
                            'description': 'shE-Wallet Monthly Contribution',
                            'retry': {'enabled': true, 'max_count': 1},
                            'send_sms_hash': true,
                            'prefill': {
                              'contact': '8888888888',
                              'email': 'test@razorpay.com'
                            },
                            'external': {
                              'wallets': ['paytm']
                            }
                          };
                          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                              handlePaymentErrorResponse);
                          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                              handlePaymentSuccessResponse);
                          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                              handleExternalWalletSelected);
                          razorpay.open(options);
                        },
                      )

                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Add your onPressed logic here
                      //     Razorpay razorpay = Razorpay();
                      //     var options = {
                      //       'key': 'rzp_test_1DP5mmOlF5G5ag',
                      //       'amount': 15000,
                      //       'name': 'Ananya Singh',
                      //       'description': 'shE-Wallet Monthly Contribution',
                      //       'retry': {'enabled': true, 'max_count': 1},
                      //       'send_sms_hash': true,
                      //       'prefill': {
                      //         'contact': '8888888888',
                      //         'email': 'test@razorpay.com'
                      //       },
                      //       'external': {
                      //         'wallets': ['paytm']
                      //       }
                      //     };
                      //     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                      //         handlePaymentErrorResponse);
                      //     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                      //         handlePaymentSuccessResponse);
                      //     razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                      //         handleExternalWalletSelected);
                      //     razorpay.open(options);
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: const Color(0xFFFF4F5A),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(16),
                      //     ),
                      //   ),
                      //   child: const SizedBox(
                      //     width: 100,
                      //     child: Center(
                      //       child: Text(
                      //         'View Payment Options',
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 16,
                      //           fontFamily: 'Poppins',
                      //           fontWeight: FontWeight.w700,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
