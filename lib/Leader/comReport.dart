// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class COmReport extends StatelessWidget {
  const COmReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leader Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFFFD9D9),
        foregroundColor: Color(0xFF002D56),
      ),
      body: Container(
        width: 410,
        height: 796,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 409,
                height: 104,
                decoration: BoxDecoration(color: Color(0xFFFF6A6A)),
              ),
            ),
            Positioned(
              left: 38,
              top: 217,
              child: Container(
                width: 334,
                height: 148,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 334,
                        height: 148,
                        decoration: ShapeDecoration(
                          color: Color(0xFF002D56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31.62),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 28,
                      top: 37,
                      child: Container(
                        width: 94,
                        height: 94,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("./images/d1.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 21.01,
                      top: 12,
                      child: Text(
                        'Monthly Deposit',
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
                      left: 151,
                      top: 84,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(color: Color(0xFFFFDC65)),
                      ),
                    ),
                    Positioned(
                      left: 151,
                      top: 61,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(color: Color(0xFFFF7258)),
                      ),
                    ),
                    Positioned(
                      left: 173,
                      top: 37,
                      child: SizedBox(
                        width: 143,
                        child: Text(
                          'Paid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.42,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 173,
                      top: 62,
                      child: SizedBox(
                        width: 151,
                        child: Text(
                          'Paid (Due Missed)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.42,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 173,
                      top: 87,
                      child: SizedBox(
                        width: 133,
                        child: Text(
                          'Unpaid                     ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.42,
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
            Positioned(
              left: 38,
              top: 382,
              child: Container(
                width: 334,
                height: 148,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 334,
                        height: 148,
                        decoration: ShapeDecoration(
                          color: Color(0xFF002D56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31.62),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 28,
                      top: 37,
                      child: Container(
                        width: 94,
                        height: 94,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("./images/d2.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 21.01,
                      top: 12,
                      child: Text(
                        'Loan Payment',
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
                      left: 151,
                      top: 37,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(color: Color(0xFF26B99A)),
                      ),
                    ),
                    Positioned(
                      left: 151,
                      top: 84,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(color: Color(0xFFF0C419)),
                      ),
                    ),
                    Positioned(
                      left: 151,
                      top: 61,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(color: Color(0xFF2980BA)),
                      ),
                    ),
                    Positioned(
                      left: 173,
                      top: 37,
                      child: SizedBox(
                        width: 143,
                        child: Text(
                          'Paid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.42,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 173,
                      top: 62,
                      child: SizedBox(
                        width: 151,
                        child: Text(
                          'Paid (Due Missed)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.42,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 173,
                      top: 87,
                      child: SizedBox(
                        width: 133,
                        child: Text(
                          'Unpaid                     ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.42,
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
            Positioned(
              left: 82,
              top: 24,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("./images/blissLogo.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 128,
              top: 23.60,
              child: SizedBox(
                width: 154,
                height: 23.49,
                child: Text(
                  'Nirvana Comm',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 53,
              top: 61.53,
              child: SizedBox(
                width: 304,
                height: 27.63,
                child: Text(
                  'Monthly Report  -  Dec 2023',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 42,
              top: 550,
              child: SizedBox(
                width: 131,
                height: 21,
                child: Text(
                  'Transaction History',
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
              left: 39,
              top: 643,
              child: Container(
                width: 331,
                height: 44,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFD9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 39,
              top: 704,
              child: Container(
                width: 331,
                height: 44,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFD9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 82,
              top: 591,
              child: Text(
                'Monthly Deposit Payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF002D56),
                  fontSize: 21.08,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: 652,
              child: Text(
                'Community Loan Payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF002D56),
                  fontSize: 21.08,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 110,
              top: 713,
              child: Text(
                'Bank Loan Payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF002D56),
                  fontSize: 21.08,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 49,
              top: 126,
              child: Container(
                width: 312,
                height: 68,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 75,
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
                      left: 79,
                      top: 1,
                      child: Container(
                        width: 75,
                        height: 67,
                        decoration: ShapeDecoration(
                          color: Color(0xFF002D56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 14.03,
                      top: 4,
                      child: Text(
                        'Deposit \nPaid',
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
                      left: 94.03,
                      top: 4,
                      child: Text(
                        'Deposit \nUnpaid',
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
                      left: 172.03,
                      top: 6,
                      child: Text(
                        'c-Loan \nUnpaid',
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
                      left: 254.03,
                      top: 7,
                      child: Text(
                        'b-Loan \nUnpaid',
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
                      left: 25,
                      top: 36,
                      child: SizedBox(
                        width: 38,
                        child: Text(
                          '13',
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
                    Positioned(
                      left: 107,
                      top: 34,
                      child: SizedBox(
                        width: 20,
                        child: Text(
                          '2',
                          textAlign: TextAlign.center,
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
                    Positioned(
                      left: 185,
                      top: 34,
                      child: SizedBox(
                        width: 20,
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
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
                    Positioned(
                      left: 263,
                      top: 34,
                      child: SizedBox(
                        width: 20,
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
