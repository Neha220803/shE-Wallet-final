// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:sample/Pages/BottomNavBar/homePage.dart';
import 'package:sample/Pages/ChatBot/bot.dart';
import 'package:sample/Pages/ChatBot/myGeminiBot.dart';
import 'package:sample/Pages/SideNavBar/sideNavBar.dart';

import 'BottomNavBar/communityDash.dart';
import 'BottomNavBar/notification.dart';
import 'BottomNavBar/profile.dart';
import 'BottomNavBar/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    CommDash(),
    Transactions(),
    Notify(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Image.asset("images/name_white.png"),
        backgroundColor: Color(0xFF002D56),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _widgetOptions.length,
              itemBuilder: (context, index) {
                return _widgetOptions[index];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xFF002D56),
        items: <TabItem>[
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(icon: Icons.groups_2, title: 'Communit'),
          TabItem(icon: Icons.monetization_on_outlined, title: 'Transactio'),
          TabItem(icon: Icons.notifications, title: 'Notificatio'),
          TabItem(icon: Icons.account_circle, title: 'Profile'),
        ],
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
          setState(() {
            _currentPage = index;
          });
        },
        initialActiveIndex: _currentPage,
        style: TabStyle.reactCircle,
        height: 60,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DBot()),
          );

          print('Floating Action Button Pressed!');
        },
        backgroundColor: Color(0xFFFFD9D9),
        child: Icon(
          Icons.chat_bubble,
          color: Color(0xFF002D56),
        ),
      ),
    );
  }
}
