// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:sample/Pages/BottomNavBar/home_page.dart';
import 'package:sample/Pages/ChatBot/bot.dart';
import 'package:sample/Pages/SideNavBar/side_nav_bar.dart';
import 'package:sample/Utils/constants.dart';

import 'BottomNavBar/community_dash.dart';
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
    const Home(),
    const CommDash(),
    const Transactions(),
    const Notify(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: Image.asset("images/name_white.png"),
        backgroundColor:  primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
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
        backgroundColor:  primaryColor,
        items: const <TabItem>[
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
            duration: const Duration(milliseconds: 700),
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
            MaterialPageRoute(builder: (context) => const DBot()),
          );

          print('Floating Action Button Pressed!');
        },
        backgroundColor:  secondaryColor,
        child: const Icon(
          Icons.chat_bubble,
          color: primaryColor,
        ),
      ),
    );
  }
}
