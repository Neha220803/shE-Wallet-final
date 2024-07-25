// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sample/Pages/BottomNavBar/carouselSlider.dart';
import 'package:sample/Pages/SideNavBar/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              height: 40,
              width: 350,
              decoration: BoxDecoration(
                // color: Color(0xFFFFD9D9),
                border: Border(
                  bottom: BorderSide(color: Color(0xFF002D56), width: 2.0),
                ),
              ),
              child: Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Color(0xFFFF4F5A),
                  fontSize: 21.59,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                width: 353,
                height: 39,
                padding: const EdgeInsets.all(8.62),
                decoration: ShapeDecoration(
                  color: Color(0xFFF0F0F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.62),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.30,
                      child: Container(
                        width: 21.55,
                        height: 21.55,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Stack(children: [
                          Icon(Icons.search),
                        ]),
                      ),
                    ),
                    const SizedBox(width: 8.62),
                    Opacity(
                      opacity: 0.30,
                      child: Text(
                        'Search Community',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(body: Scaffold(body: searComm()))),
                      
                    );}
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Active Communities',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.59,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselCommunities(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 330,
              height: 210,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 47,
                    child: Container(
                      width: 330,
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
                            left: 67,
                            top: 10,
                            child: Text(
                              'Emp Junction',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.84,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 64,
                            top: 34,
                            child: Container(
                              width: 90,
                              height: 15,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 90,
                                      height: 15,
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
                                    top: 4,
                                    child: Text(
                                      'STARTS ON 12 JAN',
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
                            top: 56,
                            child: Text(
                              'Community Lead: Isha Dhevi',
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
                            top: 15,
                            child: Container(
                              width: 41,
                              height: 41,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 41,
                                      height: 41,
                                      decoration: ShapeDecoration(
                                        color: Colors.black,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 4,
                                    top: 5,
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage("images/empLogo.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 245,
                            top: 25,
                            child: Container(
                              width: 28,
                              height: 26,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/right.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 280,
                            top: 25,
                            child: Container(
                              width: 29.93,
                              height: 27,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/wrong.png"),
                                  fit: BoxFit.cover,
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
                    top: 136,
                    child: Container(
                      width: 330,
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
                            left: 67,
                            top: 10,
                            child: Text(
                              'Radiant Hub',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.84,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 64,
                            top: 34,
                            child: Container(
                              width: 90,
                              height: 15,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 90,
                                      height: 15,
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
                                    top: 4,
                                    child: Text(
                                      'STARTS ON 26 JAN',
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
                            top: 56,
                            child: Text(
                              'Community Lead: Kavya Dharshini',
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
                            left: 245,
                            top: 25,
                            child: Container(
                              width: 28,
                              height: 26,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/right.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 280,
                            top: 25,
                            child: Container(
                              width: 29.93,
                              height: 27,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/wrong.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 11,
                            top: 15,
                            child: Container(
                              width: 41,
                              height: 41,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 41,
                                      height: 41,
                                      decoration: ShapeDecoration(
                                        color: Colors.black,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 8,
                                    top: 8,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "images/radiantLogo.png"),
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
                  Positioned(
                    left: 2,
                    top: 0,
                    child: Text(
                      'Invitations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.59,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Messages',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.59,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 196,
              decoration: ShapeDecoration(
                color: Color(0xFFFFD9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.20),
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
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 20,
                    child: Container(
                      width: 300.39,
                      height: 196.75,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFFD9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(31.62),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 21.96,
                    top: 49.19,
                    child: Container(
                      width: 350,
                      height: 37.42,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 11.42,
                            child: SizedBox(
                              width: 121.50,
                              child: Text(
                                "My Daughter's exams\nfrom tomorrow, Tips?",
                                style: TextStyle(
                                  color: Color(0xFF002D56),
                                  fontSize: 13,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 27,
                              child: Text(
                                'Preeti',
                                style: TextStyle(
                                  color: Color(0xFF888282),
                                  fontSize: 11,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 220,
                            top: 8.63,
                            child: Text(
                              'May 21, 9.42 am',
                              style: TextStyle(
                                color: Color(0xFF002D56),
                                fontSize: 11,
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
                    left: 21.96,
                    top: 97.50,
                    child: Container(
                      width: 330,
                      height: 37.42,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 11.42,
                            child: SizedBox(
                              width: 85.51,
                              child: Text(
                                'Set Schedule &\nPrioritize',
                                style: TextStyle(
                                  color: Color(0xFF002D56),
                                  fontSize: 13,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 220,
                            top: 2.64,
                            child: Text(
                              'May 21, 9.58 am',
                              style: TextStyle(
                                color: Color(0xFF002D56),
                                fontSize: 11,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 30,
                              child: Text(
                                'Aisha',
                                style: TextStyle(
                                  color: Color(0xFF888282),
                                  fontSize: 11,
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
                    left: 21.96,
                    top: 145.81,
                    child: Container(
                      width: 300,
                      height: 28,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 13,
                            child: Text(
                              ' Ban TV & electronics',
                              style: TextStyle(
                                color: Color(0xFF002D56),
                                fontSize: 13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 220,
                            top: 2.63,
                            child: Text(
                              'May 21, 10.28 am',
                              style: TextStyle(
                                color: Color(0xFF002D56),
                                fontSize: 11,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 2.63,
                            top: 0,
                            child: Text(
                              'Meera',
                              style: TextStyle(
                                color: Color(0xFF888282),
                                fontSize: 11,
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
                    left: 21.96,
                    top: 15.81,
                    child: Text(
                      'Community Chat',
                      style: TextStyle(
                        color: Color(0xFF002D56),
                        fontSize: 26,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 250,
                    top: 22.84,
                    child: SizedBox(
                      width: 52.70,
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF002D56),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          // textDecoration: TextDecoration.underline,
                          height: 0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
