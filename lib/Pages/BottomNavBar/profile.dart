// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sample/Utils/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(253, 237, 235, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 54.87,
                          height: 54.87,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: tertiaryColor),
                            image: DecorationImage(
                              image: AssetImage("images/u0.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Dhivya Varma',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                height: 0.10,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            // Add your onPressed logic here
                          },
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              width: 330.19,
              height: 370.21,
              child: Stack(
                children: [
                  Positioned(
                    left: 3.60,
                    top: 0,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Color(0xFF181D27),
                        fontSize: 17.25,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 24.27,
                    child: SizedBox(
                      width: 330.19,
                      height: 340.93,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 330.19,
                              height: 340.93,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 330.19,
                                      height: 332.93,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x0F000000),
                                            blurRadius: 42.36,
                                            offset: Offset(0, 3.85),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 15.40,
                                    top: 23.10,
                                    child: SizedBox(
                                      width: 299.39,
                                      height: 290.80,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 299.37,
                                            height: 38.51,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 292.65,
                                                  top: 13.63,
                                                  child: SizedBox(
                                                    width: 6.72,
                                                    height: 11.24,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 246.44,
                                                  top: 12.51,
                                                  child: SizedBox(
                                                    width: 13.88,
                                                    height: 13.48,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: SizedBox(
                                                    width: 203.91,
                                                    height: 38.51,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 53.91,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 150,
                                                            height: 38.14,
                                                            child: Stack(
                                                              children: const [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child: Text(
                                                                    'My Account ',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF181D27),
                                                                      fontSize:
                                                                          12.51,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      height:
                                                                          0.12,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: -0,
                                                                  top: 22.14,
                                                                  child: Text(
                                                                    'Make changes to your account',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFFABABAB),
                                                                      fontSize:
                                                                          10.59,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height:
                                                                          0.14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 38.51,
                                                            height: 38.51,
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.05,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          38.51,
                                                                      height:
                                                                          38.51,
                                                                      decoration:
                                                                          ShapeDecoration(
                                                                        color: Color(
                                                                            0xFF1A5184),
                                                                        shape:
                                                                            OvalBorder(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: 9.63,
                                                                  top: 9.63,
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        19.25,
                                                                    height:
                                                                        19.25,
                                                                    child:
                                                                        Stack(
                                                                      children: const [
                                                                        Positioned(
                                                                          left:
                                                                              3.86,
                                                                          top:
                                                                              2.26,
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                11.50,
                                                                            height:
                                                                                14.77,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 24.07),
                                          SizedBox(
                                            width: 299.37,
                                            height: 38.51,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 292.65,
                                                  top: 13.63,
                                                  child: SizedBox(
                                                    width: 6.72,
                                                    height: 11.24,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: SizedBox(
                                                    width: 191.91,
                                                    height: 38.51,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 53.91,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 138,
                                                            height: 38.14,
                                                            child: Stack(
                                                              children: const [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child: Text(
                                                                    'Saved Beneficiary',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF181D27),
                                                                      fontSize:
                                                                          12.51,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      height:
                                                                          0.12,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: -0,
                                                                  top: 22.14,
                                                                  child: Text(
                                                                    'Manage your saved account',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFFABABAB),
                                                                      fontSize:
                                                                          10.59,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height:
                                                                          0.14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 38.51,
                                                            height: 38.51,
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.05,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          38.51,
                                                                      height:
                                                                          38.51,
                                                                      decoration:
                                                                          ShapeDecoration(
                                                                        color: Color(
                                                                            0xFF1A5184),
                                                                        shape:
                                                                            OvalBorder(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: 9.63,
                                                                  top: 9.63,
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        19.25,
                                                                    height:
                                                                        19.25,
                                                                    child:
                                                                        Stack(
                                                                      children: const [
                                                                        Positioned(
                                                                          left:
                                                                              3.86,
                                                                          top:
                                                                              2.26,
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                11.50,
                                                                            height:
                                                                                14.77,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 24.07),
                                          SizedBox(
                                            width: 299.39,
                                            height: 38.51,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: SizedBox(
                                                    width: 194.91,
                                                    height: 38.51,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 53.91,
                                                          top: -0,
                                                          child: SizedBox(
                                                            width: 141,
                                                            height: 38.14,
                                                            child: Stack(
                                                              children: const [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child: Text(
                                                                    'Face ID / Touch ID',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF181D27),
                                                                      fontSize:
                                                                          12.51,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      height:
                                                                          0.12,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: -0,
                                                                  top: 22.14,
                                                                  child: Text(
                                                                    'Manage your device security',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFFABABAB),
                                                                      fontSize:
                                                                          10.59,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height:
                                                                          0.14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 38.51,
                                                            height: 38.51,
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.05,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          38.51,
                                                                      height:
                                                                          38.51,
                                                                      decoration:
                                                                          ShapeDecoration(
                                                                        color: Color(
                                                                            0xFF1A5184),
                                                                        shape:
                                                                            OvalBorder(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: 9.63,
                                                                  top: 9.63,
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        19.25,
                                                                    height:
                                                                        19.25,
                                                                    child:
                                                                        Stack(
                                                                      children: const [
                                                                        Positioned(
                                                                          left:
                                                                              3.41,
                                                                          top:
                                                                              2.21,
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                12.21,
                                                                            height:
                                                                                14.84,
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
                                                ),
                                                Positioned(
                                                  left: 250.29,
                                                  top: 4.81,
                                                  child: SizedBox(
                                                    width: 49.10,
                                                    height: 28.88,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: Container(
                                                            width: 49.10,
                                                            height: 28.88,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color: Color(
                                                                  0xFFE8E8E8),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            57.76),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 4.81,
                                                          top: 4.81,
                                                          child: Container(
                                                            width: 19.25,
                                                            height: 19.25,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color: Color(
                                                                  0xFFABABAB),
                                                              shape:
                                                                  OvalBorder(),
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
                                          const SizedBox(height: 24.07),
                                          SizedBox(
                                            width: 299.37,
                                            height: 38.51,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 292.65,
                                                  top: 13.63,
                                                  child: SizedBox(
                                                    width: 6.72,
                                                    height: 11.24,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: SizedBox(
                                                    width: 242.91,
                                                    height: 38.51,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 53.91,
                                                          top: -0,
                                                          child: SizedBox(
                                                            width: 189,
                                                            height: 38.14,
                                                            child: Stack(
                                                              children: const [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child: Text(
                                                                    'Two-Factor Authentication',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF181D27),
                                                                      fontSize:
                                                                          12.51,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      height:
                                                                          0.12,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: -0,
                                                                  top: 22.14,
                                                                  child: Text(
                                                                    'Further secure your account for safety',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFFABABAB),
                                                                      fontSize:
                                                                          10.59,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height:
                                                                          0.14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 38.51,
                                                            height: 38.51,
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.05,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          38.51,
                                                                      height:
                                                                          38.51,
                                                                      decoration:
                                                                          ShapeDecoration(
                                                                        color: Color(
                                                                            0xFF1A5184),
                                                                        shape:
                                                                            OvalBorder(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: 9.63,
                                                                  top: 9.63,
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        19.25,
                                                                    height:
                                                                        19.25,
                                                                    child:
                                                                        Stack(
                                                                      children: const [
                                                                        Positioned(
                                                                          left:
                                                                              3.41,
                                                                          top:
                                                                              2.21,
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                12.31,
                                                                            height:
                                                                                15.16,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 24.07),
                                          SizedBox(
                                            width: 299.37,
                                            height: 38.51,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 292.65,
                                                  top: 13.63,
                                                  child: SizedBox(
                                                    width: 6.72,
                                                    height: 11.24,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: SizedBox(
                                                    width: 242.91,
                                                    height: 38.51,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 53.91,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 189,
                                                            height: 38.14,
                                                            child: Stack(
                                                              children: const [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child: Text(
                                                                    'Log out',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF555555),
                                                                      fontSize:
                                                                          12.51,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      height:
                                                                          0.12,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: -0,
                                                                  top: 22.14,
                                                                  child: Text(
                                                                    'Further secure your account for safety',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFFABABAB),
                                                                      fontSize:
                                                                          10.59,
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height:
                                                                          0.14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 38.51,
                                                            height: 38.51,
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.05,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          38.51,
                                                                      height:
                                                                          38.51,
                                                                      decoration:
                                                                          ShapeDecoration(
                                                                        color: Color(
                                                                            0xFF555555),
                                                                        shape:
                                                                            OvalBorder(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: 9.63,
                                                                  top: 9.63,
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        19.25,
                                                                    height:
                                                                        19.25,
                                                                    child:
                                                                        Stack(
                                                                      children: const [
                                                                        Positioned(
                                                                          left:
                                                                              2.22,
                                                                          top:
                                                                              2.22,
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                15.27,
                                                                            height:
                                                                                14.84,
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
                                                ),
                                              ],
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
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 339.82,
              height: 175.98,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 52.25,
                      height: 40.25,
                      padding: const EdgeInsets.all(9.63),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Opacity(
                            opacity: 0.80,
                            child: Text(
                              'More',
                              style: TextStyle(
                                color: Color(0xFF181D27),
                                fontSize: 13.48,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0.10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 9.63,
                    top: 37.17,
                    child: Container(
                      width: 330.19,
                      height: 135.81,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 330.19,
                              height: 135.81,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 330.19,
                                      height: 135.81,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x0F000000),
                                            blurRadius: 42.36,
                                            offset: Offset(0, 3.85),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 15.40,
                                    top: 16.37,
                                    child: SizedBox(
                                      width: 299.37,
                                      height: 105.08,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 299.37,
                                            height: 38.51,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 292.65,
                                                  top: 13.48,
                                                  child: SizedBox(
                                                    width: 6.72,
                                                    height: 11.24,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: SizedBox(
                                                    width: 144.91,
                                                    height: 38.51,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 53.91,
                                                          top: 9.63,
                                                          child: Text(
                                                            'Help & Support',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF181D27),
                                                              fontSize: 12.51,
                                                              fontFamily:
                                                                  'DM Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 0.12,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 38.51,
                                                            height: 38.51,
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.05,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          38.51,
                                                                      height:
                                                                          38.51,
                                                                      decoration:
                                                                          ShapeDecoration(
                                                                        color: Color(
                                                                            0xFF1A5184),
                                                                        shape:
                                                                            OvalBorder(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: 9.63,
                                                                  top: 9.63,
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        19.25,
                                                                    height:
                                                                        19.25,
                                                                    child:
                                                                        Stack(
                                                                      children: const [
                                                                        Positioned(
                                                                          left:
                                                                              2.81,
                                                                          top:
                                                                              1.60,
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                13.64,
                                                                            height:
                                                                                16.04,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 24.07),
                                          SizedBox(
                                            width: 299.37,
                                            height: 38.51,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 292.65,
                                                  top: 13.63,
                                                  child: SizedBox(
                                                    width: 6.72,
                                                    height: 11.24,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: SizedBox(
                                                    width: 118.91,
                                                    height: 38.51,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 53.91,
                                                          top: 9.63,
                                                          child: Text(
                                                            'About App',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF181D27),
                                                              fontSize: 12.51,
                                                              fontFamily:
                                                                  'DM Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 0.12,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: SizedBox(
                                                            width: 38.51,
                                                            height: 38.51,
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  left: 0,
                                                                  top: 0,
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.05,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          38.51,
                                                                      height:
                                                                          38.51,
                                                                      decoration:
                                                                          ShapeDecoration(
                                                                        color: Color(
                                                                            0xFF1A5184),
                                                                        shape:
                                                                            OvalBorder(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: 9.63,
                                                                  top: 9.63,
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        19.25,
                                                                    height:
                                                                        19.25,
                                                                    child:
                                                                        Stack(
                                                                      children: const [
                                                                        Positioned(
                                                                          left:
                                                                              2.01,
                                                                          top:
                                                                              2.41,
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                15.24,
                                                                            height:
                                                                                14.44,
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
                                                ),
                                              ],
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
